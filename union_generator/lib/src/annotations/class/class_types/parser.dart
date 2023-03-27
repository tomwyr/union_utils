import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';

import '../../common/annotation_parser.dart';
import '../../common/parser_mixin.dart';
import 'declaration.dart';

class ClassTypesUnionParser
    with UnionParserMixin<ClassElement>, ClassUnionParserMixin<ClassTypesUnionDeclaration>
    implements AnnotationParser<ClassTypesUnionDeclaration> {
  @override
  ClassTypesUnionDeclaration parse(Element element, ConstantReader annotation) {
    final declaration = _createDeclaration(element, annotation);

    verifyTypesSubtypeTarget(declaration.target, declaration.types);

    return declaration;
  }

  ClassTypesUnionDeclaration _createDeclaration(Element element, ConstantReader annotation) {
    final targetElement = getTargetElement(element, annotation);
    final paramsType = getParamsType(annotation);
    final utilities = getUtilities(annotation);
    final types = _getTypes(targetElement, annotation);

    return ClassTypesUnionDeclaration(targetElement, paramsType, utilities, types);
  }

  Set<DartType> _getTypes(ClassElement targetElement, ConstantReader annotation) {
    final typesReader = annotation.read('types');

    if (typesReader.isNull) {
      final targetType = targetElement.thisType;

      bool isTargetSubtype(InterfaceElement element) =>
          element != targetElement &&
          element.allSupertypes.any((supertype) => supertype == targetType);

      return targetElement.library.topLevelElements
          .whereType<InterfaceElement>()
          .where(isTargetSubtype)
          .map((subtype) => subtype.thisType)
          .toSet();
    }

    return typesReader.setValue.map((dartObject) => dartObject.toTypeValue()!).toSet();
  }
}
