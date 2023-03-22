import '../../build_config/build_config.dart';
import '../../common/declarations/class_declarations.dart';
import '../union_case_config.dart';
import '../union_config.dart';
import '../union_type.dart';

class ClassTypesConfigFactory {
  static UnionConfig create(
    ClassTypesUnionDeclaration declaration,
    UnionBuildConfig buildConfig,
  ) {
    final unionName = declaration.target.displayName;

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
      paramsType: declaration.paramsType ?? buildConfig.paramsType,
      utilities: declaration.utilities ?? buildConfig.utilities,
    );
  }
}

class ClassTypeCasesConfigFactory {
  static UnionConfig create(
    ClassTypeCasesUnionDeclaration declaration,
    UnionBuildConfig buildConfig,
  ) {
    final unionName = declaration.target.displayName;

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
      paramsType: declaration.paramsType ?? buildConfig.paramsType,
      utilities: declaration.utilities ?? buildConfig.utilities,
    );
  }
}
