import 'package:union_annotation/union_annotation.dart';

import '../../annotations/union/config.dart';
import '../common/template.dart';
import '../common/template_mixin.dart';

class EnumMapOrNullTemplate extends Template with UnionTemplateMixin {
  EnumMapOrNullTemplate(this.config);

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
    final paramName = caseConfig.paramName.decapitalized;

    switch (config.paramsType) {
      case UnionParamsType.named:
        return '''
    T Function()? $paramName,
''';

      case UnionParamsType.positional:
        return '''
    T Function()? $paramName,
''';
    }
  }

  String getMapCall(UnionCaseConfig caseConfig) {
    final caseValue = caseConfig.caseValue;
    final paramName = caseConfig.paramName.decapitalized;

    return '''
    if (this == $caseValue) {
      return $paramName?.call();
    }
''';
  }
}
