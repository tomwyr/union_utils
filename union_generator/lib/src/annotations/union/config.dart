import 'package:union_annotation/union_annotation.dart';

import '../../build_config/build_config.dart';
import 'config_factory.dart';
import 'declaration.dart';

class UnionConfig {
  UnionConfig({
    required this.unionName,
    required this.unionType,
    required this.unionCases,
    required this.utilities,
    required this.paramsType,
  });

  factory UnionConfig.create(
    UnionDeclaration declaration,
    UnionBuildConfig buildConfig,
  ) =>
      UnionConfigFactory.create(declaration, buildConfig);

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

enum UnionType {
  classUnion,
  enumUnion,
}

class UnionCaseConfig {
  UnionCaseConfig({
    required this.caseValue,
    required this.paramName,
  });

  final String caseValue;
  final UnionParamName paramName;
}

class UnionParamName {
  UnionParamName(String value)
      : capitalized = value.capitalize(),
        decapitalized = value.decapitalize();

  final String capitalized;
  final String decapitalized;
}

extension on String {
  String capitalize() {
    if (isEmpty) return '';
    return this[0].toUpperCase() + substring(1);
  }

  String decapitalize() {
    if (isEmpty) return '';
    return this[0].toLowerCase() + substring(1);
  }
}
