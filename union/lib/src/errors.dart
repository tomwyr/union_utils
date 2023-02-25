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

/// An error which can be thrown by the generator when a type that is declared
/// as one of the union's cases is not its subtype.
class NotUnionSubtypeError extends Error {
  NotUnionSubtypeError({
    required this.unionName,
    required this.unionCaseName,
  });

  /// Name of the union that received the invalid object.
  final String unionName;

  /// Name of the type that was declared as a subtype of the union.
  final String unionCaseName;

  @override
  String toString() => '$unionCaseName is not a subtype of $unionName union.';
}
