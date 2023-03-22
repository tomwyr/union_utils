import 'package:union/union.dart';

import '../common/errors.dart';
import 'build_config.dart';

class UnionBuildConfigParser {
  UnionBuildConfigParser(this.defaults);

  final UnionBuildConfig defaults;

  UnionBuildConfig parse(Map<String, dynamic> config) {
    final localConfig = Map<String, dynamic>.from(config);

    try {
      final buildConfig = _parseConfig(localConfig);

      if (localConfig.isNotEmpty) {
        throw UnexpectedBuildConfigError(localConfig);
      }

      return buildConfig;
    } catch (error) {
      throw InvalidBuildConfigError(error);
    }
  }

  UnionBuildConfig _parseConfig(Map<String, dynamic> config) => UnionBuildConfig(
        paramsType: _parseParamsType(config.remove('params_type')),
        utilities: _parseUtilities(config.remove('utilities')),
      );

  UnionParamsType _parseParamsType(dynamic config) {
    if (config == null) return defaults.paramsType;

    config as String;

    return UnionParamsType.values.firstWhere((value) => value.name == config);
  }

  UnionUtilities _parseUtilities(dynamic config) {
    final defaults = this.defaults.utilities;

    if (config == null) return defaults;

    final localConfig = Map<String, dynamic>.from(config);

    final utilities = UnionUtilities(
      map: localConfig.remove('map') as bool? ?? defaults.map,
      maybeMap: localConfig.remove('maybe_map') as bool? ?? defaults.maybeMap,
      mapOrNull: localConfig.remove('map_or_null') as bool? ?? defaults.mapOrNull,
      asType: localConfig.remove('as_type') as bool? ?? defaults.asType,
      asTypeOrNull: localConfig.remove('as_type_or_null') as bool? ?? defaults.asTypeOrNull,
    );

    if (localConfig.isNotEmpty) {
      throw UnexpectedBuildConfigError(localConfig);
    }

    return utilities;
  }
}
