import '../../common/declarations/class_declarations.dart';
import '../union_case_config.dart';
import '../union_config.dart';
import '../union_type.dart';
import '../union_utilities.dart';

class ClassUnionConfigFactory {
  static UnionConfig createClassTypesConfig(
    ClassTypesUnionDeclaration declaration,
    String unionName,
    UnionUtilities utilities,
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
      utilities: utilities,
      paramsType: declaration.paramsType,
    );
  }

  static UnionConfig createClassTypeCasesConfig(
    ClassTypeCasesUnionDeclaration declaration,
    String unionName,
    UnionUtilities utilities,
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
      utilities: utilities,
      paramsType: declaration.paramsType,
    );
  }
}
