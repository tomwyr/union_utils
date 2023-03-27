import 'package:union/union.dart';

import '../../annotations/union/config.dart';
import '../common/template.dart';
import '../common/template_mixin.dart';

class EnumMaybeMapTemplate extends Template with UnionTemplateMixin {
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
    final paramName = caseConfig.paramName.decapitalized;

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
    final paramName = caseConfig.paramName.decapitalized;

    return '''
    if (this == $caseValue) {
      return $paramName != null ? $paramName() : orElse();
    }
''';
  }
}
