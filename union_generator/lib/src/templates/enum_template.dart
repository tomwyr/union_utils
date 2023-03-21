import 'package:union/union.dart';

import '../config/union_case_config.dart';
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
    final mapCalls = config.unionCases.map(getMapCall).join();

    return getUnionMap(
      config: config,
      mapParams: mapParams,
      mapCalls: mapCalls,
    );
  }

  String getMapParam(UnionCaseConfig caseConfig) {
    final paramName = caseConfig.paramName;

    switch (config.paramsType) {
      case UnionParamsType.named:
        return '''
    required T Function() $paramName,
''';

      case UnionParamsType.positional:
        return '''
    T Function() $paramName,
''';
    }
  }

  String getMapCall(UnionCaseConfig caseConfig) {
    final caseValue = caseConfig.caseValue;
    final paramName = caseConfig.paramName;

    return '''
    if (this == $caseValue) {
      return $paramName();
    }
''';
  }
}

class EnumMaybeMapTemplate extends Template {
  EnumMaybeMapTemplate(this.config);

  final UnionConfig config;

  String generate() {
    final mapParams = config.unionCases.map(getMapperParam).followedBy([getOrElseParam()]).join();
    final mapCalls = config.unionCases.map(getMapCall).join();

    return getUnionMaybeMap(
      config: config,
      mapParams: mapParams,
      mapCalls: mapCalls,
    );
  }

  String getMapperParam(UnionCaseConfig caseConfig) {
    final paramName = caseConfig.paramName;

    return '''
    T Function()? $paramName,
''';
  }

  String getOrElseParam() {
    switch (config.paramsType) {
      case UnionParamsType.named:
        return '''
    required T Function() orElse,
''';

      case UnionParamsType.positional:
        return '''
    T Function() orElse,
''';
    }
  }

  String getMapCall(UnionCaseConfig caseConfig) {
    final caseValue = caseConfig.caseValue;
    final paramName = caseConfig.paramName;

    return '''
    if (this == $caseValue) {
      return $paramName != null ? $paramName() : orElse();
    }
''';
  }
}
