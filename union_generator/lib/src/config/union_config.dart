import 'package:union/union.dart';

import '../common/declarations/union_declaration.dart';
import 'factories/union_config_factory.dart';
import 'union_case_config.dart';
import 'union_type.dart';

class UnionConfig {
  UnionConfig({
    required this.unionName,
    required this.unionType,
    required this.unionCases,
    required this.utilities,
    required this.paramsType,
  });

  factory UnionConfig.create(UnionDeclaration declaration) =>
      UnionConfigFactory.create(declaration);

  final String unionName;
  final UnionType unionType;
  final Iterable<UnionCaseConfig> unionCases;
  final UnionUtilities utilities;
  final UnionParamsType paramsType;

  bool get generateMap => utilities.map && unionCases.isNotEmpty;
  bool get generateMapOrNull => utilities.mapOrNull && unionCases.isNotEmpty;
  bool get generateMaybeMap => utilities.maybeMap && unionCases.isNotEmpty;
  bool get generateAsType => utilities.asType && unionCases.isNotEmpty;
  bool get generateAsTypeOrNull => utilities.asTypeOrNull && unionCases.isNotEmpty;
}
