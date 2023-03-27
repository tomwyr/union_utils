import '../../../build_config/build_config.dart';
import '../../union/config.dart';
import 'declaration.dart';

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
