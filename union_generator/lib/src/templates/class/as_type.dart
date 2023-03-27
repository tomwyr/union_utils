import '../../annotations/union/config.dart';
import '../common/template.dart';

class ClassAsTypeTemplate extends Template {
  ClassAsTypeTemplate(this.config);

  final UnionConfig config;

  @override
  String generate() {
    final asTypeCalls = config.unionCases.map(getAsTypeCall).join('\n');
    final invalidCastErrorBuilder = getInvalidCastErrorBuilder();

    return '''
    $asTypeCalls

    $invalidCastErrorBuilder
''';
  }

  String getAsTypeCall(UnionCaseConfig caseConfig) {
    final type = caseConfig.caseValue;
    final paramName = caseConfig.paramName.capitalized;
    final expectedCase = caseConfig.caseValue;

    return '''$type get as$paramName => this is $type ? this as $type : throw _getInvalidCastError($expectedCase);''';
  }

  String getInvalidCastErrorBuilder() => '''
    InvalidUnionCastError _getInvalidCastError(Type expectedCase) => InvalidUnionCastError(
      unionName: '${config.unionName}',
      expectedCase: expectedCase,
      actualCase: runtimeType,
    );
''';
}
