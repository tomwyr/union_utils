import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';
import 'package:source_gen/source_gen.dart';
import 'package:union/union.dart';

import '../common/declarations/union_declaration.dart';
import '../common/errors.dart';

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

  UnionParamsType getParamsType(ConstantReader annotation) {
    final index = annotation.read('paramsType').objectValue.getField('index')!.toIntValue()!;
    return UnionParamsType.values[index];
  }
}

mixin ClassUnionParserMixin<T extends UnionDeclaration> {
  void verifyTypesSubtypeTarget(ClassElement target, Iterable<DartType> types) {
    final targetElement = target.thisType.element;

    for (final type in types) {
      final Iterable<InterfaceElement> supertypes =
          type is InterfaceType ? type.allSupertypes.map((supertype) => supertype.element) : [];

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
