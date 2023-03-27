import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';
import 'package:source_gen/source_gen.dart';
import 'package:union/union.dart';

import '../../common/errors.dart';
import '../union/declaration.dart';

mixin UnionParserMixin<T extends Element> {
  T getTargetElement(Element element, ConstantReader annotation) {
    if (element is T) {
      return element;
    }

    if (element is ExtensionElement) {
      final extendedElement = element.extendedType.element;
      if (extendedElement is T) {
        return extendedElement;
      }
    }

    throw InvalidAnnotationTargetError(
      annotationType: annotation.toString(),
      targetType: element.displayName,
    );
  }

  void verifyUniqueNames(Element target, Iterable<String> names) {
    final uniqueNames = <String>{};

    for (final name in names) {
      if (uniqueNames.contains(name)) {
        throw DuplicatedUnionCaseNameError(
          target: target,
          name: name,
        );
      }

      uniqueNames.add(name);
    }
  }

  UnionParamsType? getParamsType(ConstantReader annotation) {
    final paramsTypeReader = annotation.peek('paramsType');
    if (paramsTypeReader == null) return null;

    final index = paramsTypeReader.objectValue.getField('index')!.toIntValue()!;

    return UnionParamsType.values[index];
  }

  UnionUtilities? getUtilities(ConstantReader annotation) {
    final utilitiesReader = annotation.peek('utilities');
    if (utilitiesReader == null) return null;

    final utilities = utilitiesReader.objectValue;

    final map = utilities.getField('map')!.toBoolValue()!;
    final mapOrNull = utilities.getField('mapOrNull')!.toBoolValue()!;
    final maybeMap = utilities.getField('maybeMap')!.toBoolValue()!;
    final asType = utilities.getField('asType')!.toBoolValue()!;
    final asTypeOrNull = utilities.getField('asTypeOrNull')!.toBoolValue()!;

    return UnionUtilities(
      map: map,
      mapOrNull: mapOrNull,
      maybeMap: maybeMap,
      asType: asType,
      asTypeOrNull: asTypeOrNull,
    );
  }
}

mixin ClassUnionParserMixin<T extends UnionDeclaration> {
  void verifyTypesSubtypeTarget(ClassElement target, Iterable<DartType> types) {
    final targetElement = target.thisType.element;

    for (final type in types) {
      final supertypes = type is InterfaceType
          ? type.allSupertypes.map((supertype) => supertype.element)
          : <InterfaceElement>[];

      if (!supertypes.contains(targetElement)) {
        throw NotUnionSubtypeError(
          target: target,
          type: type,
        );
      }
    }
  }
}

mixin EnumUnionParserMixin<T extends UnionDeclaration> {
  void verifyEnumCasesMatchTarget(EnumElement target, Iterable<DartObject> caseValues) {
    final targetValues = target.fields
        .whereNot((field) => field.name == 'values')
        .map((field) => field.computeConstantValue()!)
        .toSet();

    final missingValues = caseValues.toSet().difference(targetValues);

    if (missingValues.isNotEmpty) {
      throw NotEnumUnionCaseError(
        target: target,
        value: missingValues.first,
      );
    }
  }
}
