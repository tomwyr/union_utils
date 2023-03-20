import '../config/union_case_config.dart';
import '../config/union_config.dart';
import 'template.dart';

class ClassUnionTemplate extends Template {
  ClassUnionTemplate(this.config);

  final UnionConfig config;

  @override
  String generate() {
    final utilities = <Template>[
      if (config.generateMap) ClassMapTemplate(config),
      if (config.generateMaybeMap) ClassMaybeMapTemplate(config),
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
    final mapParams = config.unionCases.map(getMapParam).join();
    final mapCalls = config.unionCases.map(getMapCall).join();

    return getUnionMap(
      config: config,
      mapParams: mapParams,
      mapCalls: mapCalls,
    );
  }

  String getMapParam(UnionCaseConfig config) {
    final caseValue = config.caseValue;
    final paramName = config.paramName;

    return '''
    required T Function($caseValue $paramName) $paramName,
''';
  }

  String getMapCall(UnionCaseConfig config) {
    final caseValue = config.caseValue;
    final paramName = config.paramName;

    return '''
    if (this is $caseValue) {
      return $paramName(this as $caseValue);
    }
''';
  }
}

class ClassMaybeMapTemplate extends Template {
  ClassMaybeMapTemplate(this.config);

  final UnionConfig config;

  String generate() {
    final mapParams = config.unionCases.map(getMapParam).followedBy([getOrElseParam()]).join();
    final mapCalls = config.unionCases.map(getMapCall).join();

    return getUnionMaybeMap(
      config: config,
      mapParams: mapParams,
      mapCalls: mapCalls,
    );
  }

  String getMapParam(UnionCaseConfig config) {
    final caseValue = config.caseValue;
    final paramName = config.paramName;

    return '''
    T Function($caseValue $paramName)? $paramName,
''';
  }

  String getOrElseParam() => '''
    required T Function() orElse,
''';

  String getMapCall(UnionCaseConfig config) {
    final caseValue = config.caseValue;
    final paramName = config.paramName;

    return '''
    if (this is $caseValue) {
      return $paramName != null ? $paramName(this as $caseValue) : orElse();
    }
''';
  }
}
