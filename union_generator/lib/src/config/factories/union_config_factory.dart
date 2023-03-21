import '../../common/declarations/class_declarations.dart';
import '../../common/declarations/enum_declarations.dart';
import '../../common/declarations/union_declaration.dart';
import '../../common/errors.dart';
import '../union_config.dart';
import 'class_union_config_factory.dart';
import 'enum_union_config_factory.dart';

class UnionConfigFactory {
  static UnionConfig create(UnionDeclaration declaration) {
    final unionName = declaration.target.displayName;

    if (declaration is ClassTypesUnionDeclaration) {
      return ClassUnionConfigFactory.createClassTypesConfig(declaration, unionName);
    }
    if (declaration is ClassTypeCasesUnionDeclaration) {
      return ClassUnionConfigFactory.createClassTypeCasesConfig(declaration, unionName);
    }
    if (declaration is EnumUnionDeclaration) {
      return EnumUnionConfigFactory.createEnumConfig(declaration, unionName);
    }
    if (declaration is EnumCasesUnionDeclaration) {
      return EnumUnionConfigFactory.createEnumCasesConfig(declaration, unionName);
    }

    throw UnknownUnionDeclarationError(
      declarationType: declaration.runtimeType,
    );
  }
}
