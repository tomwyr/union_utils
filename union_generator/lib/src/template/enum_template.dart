import '../config/union_config.dart';
import 'template.dart';

class EnumUnionTemplate extends Template {
  EnumUnionTemplate(this.config);

  final UnionConfig config;

  @override
  String generate() {
    final utilities = <Template>[
      if (config.utilities.map) EnumMapTemplate(config),
      if (config.utilities.maybeMap) EnumMaybeMapTemplate(config),
    ].map((template) => template.generate());

    return getUnionExtension(
      utilities: utilities,
      config: config,
    );
  }
}

class EnumMapTemplate extends Template {
  EnumMapTemplate(this.config);

  final UnionConfig config;

  String generate() {
    final mapParams = config.unionCases.map(getMapParam).join();

    final mapCalls =
        config.unionCases.map((unionCase) => getMapCall(config.unionName, unionCase)).join();

    return getUnionMap(
      config: config,
      mapParams: mapParams,
      mapCalls: mapCalls,
    );
  }

  String getMapParam(String paramName) => '''
    required T Function() $paramName,
''';

  String getMapCall(String enumName, String enumValue) => '''
    if (this == $enumName.$enumValue) {
      return $enumValue();
    }
''';
}

class EnumMaybeMapTemplate extends Template {
  EnumMaybeMapTemplate(this.config);

  final UnionConfig config;

  String generate() {
    final mapParams = [
      ...config.unionCases.map(getMapperParam),
      getOrElseParam(),
    ].join();

    final mapCalls =
        config.unionCases.map((unionCase) => getMapCall(config.unionName, unionCase)).join();

    return getUnionMaybeMap(
      config: config,
      mapParams: mapParams,
      mapCalls: mapCalls,
    );
  }

  String getMapperParam(String paramName) => '''
    T Function()? $paramName,
''';

  String getOrElseParam() => '''
    required T Function() orElse,
''';

  String getMapCall(String enumName, String enumValue) => '''
    if (this == $enumName.$enumValue) {
      return $enumValue != null ? $enumValue() : orElse();
    }
''';
}
