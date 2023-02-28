import '../config/union_config.dart';

mixin TemplateUtils {
  String getUnionExtension({
    required Iterable<String> utilities,
    required UnionConfig config,
  }) {
    final extensionName = '${config.unionName}Union';
    final unionName = config.unionName;
    final body = utilities.join('\n');

    return '''
extension $extensionName on $unionName {
$body
}
''';
  }

  String getUnionMap({
    required UnionConfig config,
    required String mapParams,
    required String mapCalls,
  }) {
    final unknownCaseError = _getUnknownCaseError(config);

    return '''
  T map<T>({
$mapParams
  }) {
$mapCalls
$unknownCaseError
  }
''';
  }

  String getUnionMaybeMap({
    required UnionConfig config,
    required String mapParams,
    required String mapCalls,
  }) {
    final unknownCaseError = _getUnknownCaseError(config);

    return '''
  T maybeMap<T>({
$mapParams
  }) {
$mapCalls
$unknownCaseError
  }
''';
  }

  String _getUnknownCaseError(UnionConfig config) => '''
    throw UnknownUnionCaseError(
      unionName: '${config.unionName}',
      unionCase: this,
    );
''';
}
