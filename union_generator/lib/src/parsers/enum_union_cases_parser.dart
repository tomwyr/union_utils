import 'package:analyzer/dart/element/element.dart';
import 'package:collection/collection.dart';
import 'package:source_gen/source_gen.dart';

import '../common/declarations/enum_declarations.dart';
import 'annotation_parser.dart';
import 'union_parser_mixin.dart';

class EnumCasesUnionParser
    with UnionParserMixin<EnumElement>, EnumUnionParserMixin<EnumCasesUnionDeclaration>
    implements AnnotationParser<EnumCasesUnionDeclaration> {
  @override
  EnumCasesUnionDeclaration parse(Element element, ConstantReader annotation) {
    final declaration = _createDeclaration(element, annotation);

    verifyUniqueNames(
      element,
      declaration.cases.map((caseDeclaration) => caseDeclaration.name).whereNotNull(),
    );

    verifyEnumCasesMatchTarget(
      declaration.target,
      declaration.cases.map((caseDeclaration) => caseDeclaration.value),
    );

    return declaration;
  }

  EnumCasesUnionDeclaration _createDeclaration(Element element, ConstantReader annotation) {
    final targetElement = getTargetElement(element, annotation);
    final paramsType = getParamsType(annotation);
    final cases = _getEnumCases(targetElement, annotation);

    return EnumCasesUnionDeclaration(targetElement, paramsType, cases);
  }

  Set<EnumCaseDeclaration> _getEnumCases(EnumElement targetElement, ConstantReader annotation) {
    final valuesReader = annotation.read('cases');

    if (valuesReader.isNull) {
      return {};
    }

    return valuesReader.setValue
        .map(
          (dartObject) => EnumCaseDeclaration(
            value: dartObject.getField('value')!,
            name: dartObject.getField('name')!.toStringValue(),
          ),
        )
        .toSet();
  }
}
