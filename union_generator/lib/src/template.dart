import 'config.dart';
import 'union_type.dart';

class UnionFileTemplate {
  UnionFileTemplate(this.config);

  final UnionConfig config;

  String generate() {
    switch (config.unionType) {
      case UnionType.classUnion:
        return ClassUnionTemplate(config).generate();
      case UnionType.enumUnion:
        return EnumUnionTemplate(config).generate();
    }
  }
}

class ClassUnionTemplate with UnionTemplate {
  ClassUnionTemplate(this.config);

  final UnionConfig config;

  String generate() {
    final mapParams = config.unionCases
        .map((unionType) => _getMapParam(unionType, unionType.decapitalize()))
        .join();
    final mapCalls = config.unionCases
        .map((unionType) => _getMapCall(unionType, unionType.decapitalize()))
        .join();

    return getUnionTemplate(
      config: config,
      mapParams: mapParams,
      mapCalls: mapCalls,
    );
  }

  String _getMapParam(String paramType, String paramName) => '''
    required T Function($paramType $paramName) $paramName,
''';

  String _getMapCall(String paramType, String paramName) => '''
    if (this is $paramType) {
      return $paramName(this as $paramType);
    }
''';
}

class EnumUnionTemplate with UnionTemplate {
  EnumUnionTemplate(this.config);

  final UnionConfig config;

  String generate() {
    final mapParams = config.unionCases.map(_getMapParam).join();
    final mapCalls =
        config.unionCases.map((unionCase) => _getMapCall(config.unionName, unionCase)).join();

    return getUnionTemplate(
      config: config,
      mapParams: mapParams,
      mapCalls: mapCalls,
    );
  }

  String _getMapParam(String paramName) => '''
    required T Function() $paramName,
''';

  String _getMapCall(String enumName, String enumValue) => '''
    if (this == $enumName.$enumValue) {
      return $enumValue();
    }
''';
}

class UnionTemplate {
  String getUnionTemplate({
    required UnionConfig config,
    required String mapParams,
    required String mapCalls,
  }) {
    final extensionName = '${config.unionName}Union';
    final unionName = config.unionName;
    final unknownCaseError = _getUnknownCaseError(config);

    return '''
extension $extensionName on $unionName {
  T map<T>({
$mapParams
  }) {
$mapCalls
$unknownCaseError
  }
} 
''';
  }

  String _getUnknownCaseError(UnionConfig config) => '''
    throw UnknownUnionCaseError(
      unionName: '${config.unionName}',
      unionCase: this,
    );
'''
      .trimLeft();
}

extension on String {
  String decapitalize() {
    if (isEmpty) return '';
    return this[0].toLowerCase() + substring(1);
  }
}
