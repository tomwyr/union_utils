import '../../build_config/build_config.dart';
import '../../common/declarations/class_declarations.dart';
import '../../common/declarations/enum_declarations.dart';
import '../../common/declarations/union_declaration.dart';
import '../../common/errors.dart';
import '../union_config.dart';
import 'class_union_config_factory.dart';
import 'enum_union_config_factory.dart';

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
