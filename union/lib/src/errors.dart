/// An error which can be thrown in runtime when a generated utility is given
/// an object that is not a valid union subtype.This should never be the case,
/// if the union was successfully generated before running the program.
class UnknownUnionCaseError extends Error {
  UnknownUnionCaseError({
    required this.unionName,
    required this.unionCase,
  });

  /// Name of the union that received the invalid object.
  final String unionName;

  /// The object that was passed to the utility method.
  final Object unionCase;

  @override
  String toString() => '$unionCase is not a valid case for $unionName union.';
}

/// An error which can be thrown in runtime when a generated utility attempts
/// to cast a union to a type that is not a valid union subtype.
class InvalidUnionCastError extends Error {
  InvalidUnionCastError({
    required this.unionName,
    required this.expectedCase,
    required this.actualCase,
  });

  /// Name of the union for which the cast failed.
  final String unionName;

  /// Expected union case that the cast attempted to return.
  final Object expectedCase;

  /// Actual union case that was passed to the utility method.
  final Object actualCase;

  @override
  String toString() => 'Attempted to cast $unionName union as $expectedCase but'
      ' the actual case was $actualCase.';
}
