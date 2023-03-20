import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import '../common/declarations/class_declarations.dart';
import 'annotation_parser.dart';
import 'union_parser_mixin.dart';

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
    final types =
        annotation.read('types').setValue.map((dartObject) => dartObject.toTypeValue()!).toSet();

    return ClassTypesUnionDeclaration(targetElement, types);
  }
}
