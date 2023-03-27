import '../../annotations/union/config.dart';
import '../common/template.dart';

class ClassAsTypeOrNullTemplate extends Template {
  ClassAsTypeOrNullTemplate(this.config);

  final UnionConfig config;

  @override
  String generate() {
    final asTypeOrNullCalls =
        config.unionCases.map(getAsTypeOrNullCall).join('\n');

    return '$asTypeOrNullCalls\n';
  }

  String getAsTypeOrNullCall(UnionCaseConfig caseConfig) {
    final type = caseConfig.caseValue;
    final nullableType = type.endsWith('?') ? type : '$type?';
    final paramName = caseConfig.paramName.capitalized;

    return '$nullableType get as${paramName}OrNull => this is $type ? this as $type : null;';
  }
}
