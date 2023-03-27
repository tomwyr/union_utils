import 'package:union/union.dart';

import '../../annotations/union/config.dart';

mixin UnionTemplateMixin {
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

    switch (config.paramsType) {
      case UnionParamsType.named:
        return '''
  T map<T>({
$mapParams
  }) {
$mapCalls
$unknownCaseError
  }
''';

      case UnionParamsType.positional:
        return '''
  T map<T>(
$mapParams
  ) {
$mapCalls
$unknownCaseError
  }
''';
    }
  }

  String getUnionMapOrNull({
    required UnionConfig config,
    required String mapParams,
    required String mapCalls,
  }) {
    final unknownCaseError = _getUnknownCaseError(config);

    switch (config.paramsType) {
      case UnionParamsType.named:
        return '''
  T? mapOrNull<T>({
$mapParams
  }) {
$mapCalls
$unknownCaseError
  }
''';

      case UnionParamsType.positional:
        return '''
  T? mapOrNull<T>(
$mapParams
  ) {
$mapCalls
$unknownCaseError
  }
''';
    }
  }

  String getUnionMaybeMap({
    required UnionConfig config,
    required String mapParams,
    required String mapCalls,
  }) {
    final unknownCaseError = _getUnknownCaseError(config);

    switch (config.paramsType) {
      case UnionParamsType.named:
        return '''
  T maybeMap<T>({
$mapParams
  }) {
$mapCalls
$unknownCaseError
  }
''';

      case UnionParamsType.positional:
        return '''
  T maybeMap<T>(
$mapParams
  ) {
$mapCalls
$unknownCaseError
  }
''';
    }
  }

  String _getUnknownCaseError(UnionConfig config) => '''
    throw UnknownUnionCaseError(
      unionName: '${config.unionName}',
      unionCase: runtimeType,
    );
''';
}
