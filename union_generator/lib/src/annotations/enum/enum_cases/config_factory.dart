import '../../../build_config/build_config.dart';
import '../../union/config.dart';
import 'declaration.dart';

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
