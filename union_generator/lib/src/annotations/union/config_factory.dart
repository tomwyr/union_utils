import '../../build_config/build_config.dart';
import '../../common/errors.dart';
import '../class/class_type_cases/config_factory.dart';
import '../class/class_type_cases/declaration.dart';
import '../class/class_types/config_factory.dart';
import '../class/class_types/declaration.dart';
import '../enum/enum/config_factory.dart';
import '../enum/enum/declaration.dart';
import '../enum/enum_cases/config_factory.dart';
import '../enum/enum_cases/declaration.dart';
import 'config.dart';
import 'declaration.dart';

class UnionConfigFactory {
  static UnionConfig create(
    UnionDeclaration declaration,
    UnionBuildConfig buildConfig,
  ) {
    if (declaration is ClassTypesUnionDeclaration) {
      return ClassTypesConfigFactory.create(
        declaration,
        buildConfig,
      );
    }
    if (declaration is ClassTypeCasesUnionDeclaration) {
      return ClassTypeCasesConfigFactory.create(
        declaration,
        buildConfig,
      );
    }
    if (declaration is EnumUnionDeclaration) {
      return EnumConfigFactory.create(
        declaration,
        buildConfig,
      );
    }
    if (declaration is EnumCasesUnionDeclaration) {
      return EnumCasesConfigFactory.create(
        declaration,
        buildConfig,
      );
    }

    throw UnknownUnionDeclarationError(
      declarationType: declaration.runtimeType,
    );
  }
}
