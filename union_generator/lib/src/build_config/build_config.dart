import 'package:build/build.dart';
import 'package:union/union.dart';

import 'build_config_parser.dart';

class UnionBuildConfig {
  const UnionBuildConfig({
    required this.paramsType,
    required this.utilities,
  });

  static const defaults = UnionBuildConfig(
    paramsType: UnionParamsType.named,
    utilities: UnionUtilities.all(),
  );

  factory UnionBuildConfig.fromOptions(BuilderOptions options) =>
      UnionBuildConfigParser(defaults).parse(options.config);

  final UnionParamsType paramsType;
  final UnionUtilities utilities;
}
