import '../../common/declarations/class_declarations.dart';
import '../union_case_config.dart';
import '../union_config.dart';
import '../union_type.dart';

class ClassUnionConfigFactory {
  static UnionConfig createClassTypesConfig(
    ClassTypesUnionDeclaration declaration,
    String unionName,
  ) {
    final unionCases = declaration.types.map((type) {
      final typeName = type.element!.displayName;
      final paramName = UnionParamName(typeName);

      return UnionCaseConfig(
        caseValue: typeName,
        paramName: paramName,
      );
    });

    return UnionConfig(
      unionName: unionName,
      unionType: UnionType.classUnion,
      unionCases: unionCases,
      utilities: declaration.utilities,
      paramsType: declaration.paramsType,
    );
  }

  static UnionConfig createClassTypeCasesConfig(
    ClassTypeCasesUnionDeclaration declaration,
    String unionName,
  ) {
    final unionCases = declaration.cases.map((caseDeclaration) {
      final typeName = caseDeclaration.type.element!.displayName;
      final paramName = UnionParamName(caseDeclaration.name ?? typeName);

      return UnionCaseConfig(
        caseValue: typeName,
        paramName: paramName,
      );
    });

    return UnionConfig(
      unionName: unionName,
      unionType: UnionType.classUnion,
      unionCases: unionCases,
      utilities: declaration.utilities,
      paramsType: declaration.paramsType,
    );
  }
}
