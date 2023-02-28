import '../config/union_config.dart';
import 'template.dart';

class ClassUnionTemplate extends Template {
  ClassUnionTemplate(this.config);

  final UnionConfig config;

  @override
  String generate() {
    final utilities = <Template>[
      if (config.utilities.map) ClassMapTemplate(config),
      if (config.utilities.maybeMap) ClassMaybeMapTemplate(config),
    ].map((template) => template.generate());

    return getUnionExtension(
      utilities: utilities,
      config: config,
    );
  }
}

class ClassMapTemplate extends Template {
  ClassMapTemplate(this.config);

  final UnionConfig config;

  String generate() {
    final mapParams = config.unionCases
        .map((unionType) => getMapParam(unionType, unionType.decapitalize()))
        .join();

    final mapCalls = config.unionCases
        .map((unionType) => getMapCall(unionType, unionType.decapitalize()))
        .join();

    return getUnionMap(
      config: config,
      mapParams: mapParams,
      mapCalls: mapCalls,
    );
  }

  String getMapParam(String paramType, String paramName) => '''
    required T Function($paramType $paramName) $paramName,
''';

  String getMapCall(String paramType, String paramName) => '''
    if (this is $paramType) {
      return $paramName(this as $paramType);
    }
''';
}

class ClassMaybeMapTemplate extends Template {
  ClassMaybeMapTemplate(this.config);

  final UnionConfig config;

  String generate() {
    final mapParams = [
      ...config.unionCases.map((unionType) => getMapParam(unionType, unionType.decapitalize())),
      getOrElseParam(),
    ].join();

    final mapCalls = config.unionCases
        .map((unionType) => getMapCall(unionType, unionType.decapitalize()))
        .join();

    return getUnionMaybeMap(
      config: config,
      mapParams: mapParams,
      mapCalls: mapCalls,
    );
  }

  String getMapParam(String paramType, String paramName) => '''
    T Function($paramType $paramName)? $paramName,
''';

  String getOrElseParam() => '''
    required T Function() orElse,
''';

  String getMapCall(String paramType, String paramName) => '''
    if (this is $paramType) {
      return $paramName != null ? $paramName(this as $paramType) : orElse();
    }
''';
}

extension on String {
  String decapitalize() {
    if (isEmpty) return '';
    return this[0].toLowerCase() + substring(1);
  }
}
