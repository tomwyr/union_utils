import '../../build_config/build_config.dart';
import '../../common/declarations/enum_declarations.dart';
import '../union_case_config.dart';
import '../union_config.dart';
import '../union_type.dart';

class EnumConfigFactory {
  static UnionConfig create(
    EnumUnionDeclaration declaration,
    UnionBuildConfig buildConfig,
  ) {
    final unionName = declaration.target.displayName;

    final typeName = declaration.target.displayName;
    final unionCases = declaration.values.map((value) {
      final fieldName = value.variable!.name;
      final caseValue = '$typeName.$fieldName';
      final paramName = UnionParamName(fieldName);

      return UnionCaseConfig(
        caseValue: caseValue,
        paramName: paramName,
      );
    });

    return UnionConfig(
      unionName: unionName,
      unionType: UnionType.enumUnion,
      unionCases: unionCases,
      paramsType: declaration.paramsType ?? buildConfig.paramsType,
      utilities: declaration.utilities ?? buildConfig.utilities,
    );
  }
}

class EnumCasesConfigFactory {
  static UnionConfig create(
    EnumCasesUnionDeclaration declaration,
    UnionBuildConfig buildConfig,
  ) {
    final unionName = declaration.target.displayName;

    final typeName = declaration.target.displayName;
    final unionCases = declaration.cases.map((caseDeclaration) {
      final enumField = declaration.target.fields.firstWhere(
        (field) => field.name == caseDeclaration.value.variable!.name,
      );

      final fieldName = enumField.name;
      final caseValue = '$typeName.$fieldName';
      final paramName = UnionParamName(caseDeclaration.name ?? enumField.name);

      return UnionCaseConfig(
        caseValue: caseValue,
        paramName: paramName,
      );
    });

    return UnionConfig(
      unionName: unionName,
      unionType: UnionType.enumUnion,
      unionCases: unionCases,
      paramsType: declaration.paramsType ?? buildConfig.paramsType,
      utilities: declaration.utilities ?? buildConfig.utilities,
    );
  }
}
