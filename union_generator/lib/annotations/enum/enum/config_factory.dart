import '../../../build_config/build_config.dart';
import '../../union/config.dart';
import 'declaration.dart';

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
