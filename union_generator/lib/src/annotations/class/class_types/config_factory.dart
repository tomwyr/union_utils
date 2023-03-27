import '../../../build_config/build_config.dart';
import '../../union/config.dart';
import 'declaration.dart';

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
