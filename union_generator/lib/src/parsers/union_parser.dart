import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import '../common/declarations/union_declaration.dart';
import '../common/errors.dart';
import 'annotation_parser.dart';
import 'class_type_cases_union_parser.dart';
import 'class_types_union_parser.dart';
import 'enum_union_cases_parser.dart';
import 'enum_union_parser.dart';

class UnionParser implements AnnotationParser<UnionDeclaration> {
  UnionDeclaration parse(Element element, ConstantReader annotation) {
    final annotationType = annotation.objectValue.type!.element!.displayName;
    return _createParserFor(annotationType).parse(element, annotation);
  }

  AnnotationParser<UnionDeclaration> _createParserFor(String annotationType) {
    switch (annotationType) {
      case 'ClassTypesUnion':
        return ClassTypesUnionParser();
      case 'ClassTypeCasesUnion':
        return ClassTypeCasesUnionParser();
      case 'EnumUnion':
        return EnumUnionParser();
      case 'EnumCasesUnion':
        return EnumCasesUnionParser();
    }

    throw UnknownAnnotationError(annotationType: annotationType);
  }
}
