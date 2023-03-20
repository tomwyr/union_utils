import '../../common/declarations/class_declarations.dart';
import '../../common/declarations/enum_declarations.dart';
import '../../common/declarations/union_declaration.dart';
import '../../common/errors.dart';
import '../union_config.dart';
import '../union_utilities.dart';
import 'class_union_config_factory.dart';
import 'enum_union_config_factory.dart';

class UnionConfigFactory {
  static UnionConfig create(UnionDeclaration declaration) {
    final unionName = declaration.target.displayName;
    final utilities = UnionUtilities.all;

    if (declaration is ClassTypesUnionDeclaration) {
      return ClassUnionConfigFactory.createClassTypesConfig(declaration, unionName, utilities);
    }
    if (declaration is ClassTypeCasesUnionDeclaration) {
      return ClassUnionConfigFactory.createClassTypeCasesConfig(declaration, unionName, utilities);
    }
    if (declaration is EnumUnionDeclaration) {
      return EnumUnionConfigFactory.createEnumConfig(declaration, unionName, utilities);
    }
    if (declaration is EnumCasesUnionDeclaration) {
      return EnumUnionConfigFactory.createEnumCasesConfig(declaration, unionName, utilities);
    }

    throw UnknownUnionDeclarationError(
      declarationType: declaration.runtimeType,
    );
  }
}
