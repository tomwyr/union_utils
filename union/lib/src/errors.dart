class UnknownUnionCaseError extends Error {
  UnknownUnionCaseError({
    required this.unionName,
    required this.unionCase,
  });

  final String unionName;
  final Object unionCase;

  @override
  String toString() => '$unionCase is not a valid case for $unionName union.';
}

class NotUnionSubtypeError extends Error {
  NotUnionSubtypeError({
    required this.unionName,
    required this.unionCaseName,
  });

  final String unionName;
  final String unionCaseName;
  @override
  String toString() => '$unionCaseName is not a subtype of $unionName union.';
}
