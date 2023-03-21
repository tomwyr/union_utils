/// A class that allows for the configuration of utilities that are generated.
class UnionUtilities {
  /// Creates a [UnionUtilities] instance that generates utilities based on the
  /// specified values.
  const UnionUtilities({
    required this.map,
    required this.maybeMap,
    required this.asType,
    required this.asTypeOrNull,
  });

  /// Creates a [UnionUtilities] instance that generates all utilities except
  /// the manually disabled ones.
  const UnionUtilities.all({
    this.map = true,
    this.maybeMap = true,
    this.asType = true,
    this.asTypeOrNull = true,
  });

  /// Creates a [UnionUtilities] instance that generates no utilities except
  /// the manually enabled ones.
  const UnionUtilities.only({
    this.map = false,
    this.maybeMap = false,
    this.asType = false,
    this.asTypeOrNull = false,
  });

  /// Whether to generate a `map` method.
  final bool map;

  /// Whether to generate a `maybeMap` method.
  final bool maybeMap;

  /// Whether to generate `as*Type*` getters.
  final bool asType;

  /// Whether to generate `as*Type*OrNull` getters.
  final bool asTypeOrNull;
}
