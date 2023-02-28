import 'package:analyzer/dart/element/element.dart';
import 'package:collection/collection.dart';
import 'package:source_gen/source_gen.dart';
import 'package:union/union.dart';

import 'union_config.dart';

abstract class UnionConfigReader {
  factory UnionConfigReader(Element element, ConstantReader annotation) {
    if (element is ClassElement) {
      return ClassConfigReader(
        element: element,
        annotation: annotation,
      );
    }

    if (element is EnumElement) {
      return EnumUnionConfigReader(element: element);
    }

    if (element is ExtensionElement) {
      final extendedElement = element.extendedType.element;

      if (extendedElement is ClassElement) {
        return ClassConfigReader(
          element: extendedElement,
          annotation: annotation,
        );
      }

      if (extendedElement is EnumElement) {
        return EnumUnionConfigReader(
          element: extendedElement,
        );
      }
    }

    throw InvalidGenerationSourceError(
      'Unions can only be generated for classes and enums or their extensions '
      'but ${element.name} was annotated as a union.',
    );
  }

  UnionConfig read();
}

class ClassConfigReader implements UnionConfigReader {
  ClassConfigReader({
    required this.element,
    required this.annotation,
  });

  final ClassElement element;
  final ConstantReader annotation;

  UnionConfig read() {
    final typesReader = annotation.read('types');

    final unionTypeElements =
        typesReader.listValue.map((dartObject) => dartObject.toTypeValue()?.element).whereNotNull();

    unionTypeElements.forEach(_checkIsUnionSubtype);

    final unionName = element.name;
    final unionCases = unionTypeElements.map((element) => element.name).whereNotNull();

    return UnionConfig(
      unionName: unionName,
      unionCases: unionCases,
      unionType: UnionType.classUnion,
      utilities: UnionUtilities.all,
    );
  }

  void _checkIsUnionSubtype(Element unionElement) {
    final isUnionSubtype = unionElement is InterfaceElement &&
        unionElement.allSupertypes.any((supertype) => supertype == element.thisType);

    if (!isUnionSubtype) {
      throw NotUnionSubtypeError(
        unionName: element.name,
        unionCaseName: unionElement.name ?? unionElement.displayName,
      );
    }
  }
}

class EnumUnionConfigReader implements UnionConfigReader {
  EnumUnionConfigReader({
    required this.element,
  });

  final EnumElement element;

  UnionConfig read() {
    final unionName = element.name;
    final unionCases = element.fields
        .map((fieldElement) => fieldElement.name)
        .whereNot((name) => name == 'values');

    return UnionConfig(
      unionName: unionName,
      unionCases: unionCases,
      unionType: UnionType.enumUnion,
      utilities: UnionUtilities.all,
    );
  }
}
