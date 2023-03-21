class UnionCaseConfig {
  UnionCaseConfig({
    required this.caseValue,
    required this.paramName,
  });

  final String caseValue;
  final UnionParamName paramName;
}

class UnionParamName {
  UnionParamName(String value)
      : capitalized = value.capitalize(),
        decapitalized = value.decapitalize();

  final String capitalized;
  final String decapitalized;
}

extension on String {
  String capitalize() {
    if (isEmpty) return '';
    return this[0].toUpperCase() + substring(1);
  }

  String decapitalize() {
    if (isEmpty) return '';
    return this[0].toLowerCase() + substring(1);
  }
}
