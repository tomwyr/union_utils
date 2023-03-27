import 'package:union/union.dart';

import '../../annotations/union/config.dart';
import '../common/template.dart';
import '../common/template_mixin.dart';

class ClassMaybeMapTemplate extends Template with UnionTemplateMixin {
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
