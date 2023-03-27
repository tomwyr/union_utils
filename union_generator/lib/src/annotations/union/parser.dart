import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import '../../common/errors.dart';
import '../class/class_type_cases/parser.dart';
import '../class/class_types/parser.dart';
import '../common/annotation_parser.dart';
import '../enum/enum/parser.dart';
import '../enum/enum_cases/parser.dart';
import 'declaration.dart';

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
