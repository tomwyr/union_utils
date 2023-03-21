class UnionUtilities {
  const UnionUtilities({
    required this.map,
    required this.maybeMap,
    required this.asType,
    required this.asTypeOrNull,
  });

  static const all = UnionUtilities(
    map: true,
    maybeMap: true,
    asType: true,
    asTypeOrNull: true,
  );

  final bool map;
  final bool maybeMap;
  final bool asType;
  final bool asTypeOrNull;
}
