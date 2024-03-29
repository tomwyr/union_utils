import 'package:analyzer/dart/element/element.dart';
import 'package:collection/collection.dart';
import 'package:source_gen/source_gen.dart';

import '../../common/annotation_parser.dart';
import '../../common/parser_mixin.dart';
import '../class_types/declaration.dart';
import 'declaration.dart';

class ClassTypeCasesUnionParser
    with
        UnionParserMixin<ClassElement>,
        ClassUnionParserMixin<ClassTypesUnionDeclaration>
    implements AnnotationParser<ClassTypeCasesUnionDeclaration> {
  @override
  ClassTypeCasesUnionDeclaration parse(
      Element element, ConstantReader annotation) {
    final declaration = _createDeclaration(element, annotation);

    verifyUniqueNames(
      element,
      declaration.cases
          .map((caseDeclaration) => caseDeclaration.name)
          .whereNotNull(),
    );

    verifyTypesSubtypeTarget(
      declaration.target,
      declaration.cases.map((caseDeclaration) => caseDeclaration.type),
    );

    return declaration;
  }

  ClassTypeCasesUnionDeclaration _createDeclaration(
      Element element, ConstantReader annotation) {
    final targetElement = getTargetElement(element, annotation);
    final paramsType = getParamsType(annotation);
    final utilities = getUtilities(annotation);
    final cases = _getUnionCases(annotation);

    return ClassTypeCasesUnionDeclaration(
        targetElement, paramsType, utilities, cases);
  }

  Set<TypeCaseDeclaration> _getUnionCases(ConstantReader annotation) =>
      annotation
          .read('cases')
          .setValue
          .map(
            (dartObject) => TypeCaseDeclaration(
              type: dartObject.getField('type')!.toTypeValue()!,
              name: dartObject.getField('name')!.toStringValue(),
            ),
          )
          .toSet();
}
