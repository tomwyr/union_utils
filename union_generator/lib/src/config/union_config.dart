import '../common/declarations/union_declaration.dart';
import 'factories/union_config_factory.dart';
import 'union_case_config.dart';
import 'union_type.dart';
import 'union_utilities.dart';

class UnionConfig {
  UnionConfig({
    required this.unionName,
    required this.unionType,
    required this.unionCases,
    required this.utilities,
  });

  factory UnionConfig.create(UnionDeclaration declaration) =>
      UnionConfigFactory.create(declaration);

  final String unionName;
  final UnionType unionType;
  final Iterable<UnionCaseConfig> unionCases;
  final UnionUtilities utilities;

  bool get generateMap => utilities.map && unionCases.isNotEmpty;
  bool get generateMaybeMap => utilities.maybeMap && unionCases.isNotEmpty;
}
