import 'package:union_annotation/union_annotation.dart';

import '../../annotations/union/config.dart';
import '../common/template.dart';
import '../common/template_mixin.dart';

class ClassMapTemplate extends Template with UnionTemplateMixin {
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
