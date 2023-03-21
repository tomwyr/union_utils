import 'package:union/union.dart';

import '../config/union_case_config.dart';
import '../config/union_config.dart';
import 'template.dart';

class ClassUnionTemplate extends Template {
  ClassUnionTemplate(this.config);

  final UnionConfig config;

  @override
  String generate() {
    final utilities = <Template>[
      if (config.generateAsType) ClassAsTypeTemplate(config),
      if (config.generateAsTypeOrNull) ClassAsTypeOrNullTemplate(config),
      if (config.generateMap) ClassMapTemplate(config),
      if (config.generateMapOrNull) ClassMapOrNullTemplate(config),
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

  String getMapParam(UnionCaseConfig caseConfig) {
    final caseValue = caseConfig.caseValue;
    final paramName = caseConfig.paramName.decapitalized;

    switch (config.paramsType) {
      case UnionParamsType.named:
        return '''
    required T Function($caseValue $paramName) $paramName,
''';

      case UnionParamsType.positional:
        return '''
    T Function($caseValue $paramName) $paramName,
''';
    }
  }

  String getMapCall(UnionCaseConfig caseConfig) {
    final caseValue = caseConfig.caseValue;
    final paramName = caseConfig.paramName.decapitalized;

    return '''
    if (this is $caseValue) {
      return $paramName(this as $caseValue);
    }
''';
  }
}

class ClassMapOrNullTemplate extends Template {
  ClassMapOrNullTemplate(this.config);

  final UnionConfig config;

  @override
  String generate() {
    final mapParams = config.unionCases.map(getMapParam).join();
    final mapCalls = config.unionCases.map(getMapCall).join();

    return getUnionMapOrNull(
      config: config,
      mapParams: mapParams,
      mapCalls: mapCalls,
    );
  }

  String getMapParam(UnionCaseConfig caseConfig) {
    final caseValue = caseConfig.caseValue;
    final paramName = caseConfig.paramName.decapitalized;

    switch (config.paramsType) {
      case UnionParamsType.named:
        return '''
    T Function($caseValue $paramName)? $paramName,
''';

      case UnionParamsType.positional:
        return '''
    T Function($caseValue $paramName)? $paramName,
''';
    }
  }

  String getMapCall(UnionCaseConfig caseConfig) {
    final caseValue = caseConfig.caseValue;
    final paramName = caseConfig.paramName.decapitalized;

    return '''
    if (this is $caseValue) {
      return $paramName?.call(this as $caseValue);
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

  String getMapParam(UnionCaseConfig caseConfig) {
    final caseValue = caseConfig.caseValue;
    final paramName = caseConfig.paramName.decapitalized;

    return '''
    T Function($caseValue $paramName)? $paramName,
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
    final paramName = caseConfig.paramName.decapitalized;

    return '''
    if (this is $caseValue) {
      return $paramName != null ? $paramName(this as $caseValue) : orElse();
    }
''';
  }
}

class ClassAsTypeTemplate extends Template {
  ClassAsTypeTemplate(this.config);

  final UnionConfig config;

  @override
  String generate() {
    final asTypeCalls = config.unionCases.map(getAsTypeCall).join('\n');

    return '$asTypeCalls\n';
  }

  String getAsTypeCall(UnionCaseConfig caseConfig) {
    final type = caseConfig.caseValue;
    final paramName = caseConfig.paramName.capitalized;

    return '$type get as$paramName => this as $type;';
  }
}

class ClassAsTypeOrNullTemplate extends Template {
  ClassAsTypeOrNullTemplate(this.config);

  final UnionConfig config;

  @override
  String generate() {
    final asTypeOrNullCalls = config.unionCases.map(getAsTypeOrNullCall).join('\n');

    return '$asTypeOrNullCalls\n';
  }

  String getAsTypeOrNullCall(UnionCaseConfig caseConfig) {
    final type = caseConfig.caseValue;
    final nullableType = type.endsWith('?') ? type : '$type?';
    final paramName = caseConfig.paramName.capitalized;

    return '$nullableType get as${paramName}OrNull => this is $type ? this as $type : null;';
  }
}
