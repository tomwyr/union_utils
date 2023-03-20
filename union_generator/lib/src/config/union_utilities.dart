class UnionUtilities {
  const UnionUtilities({
    required this.map,
    required this.maybeMap,
  });

  static const all = UnionUtilities(
    map: true,
    maybeMap: true,
  );

  final bool map;
  final bool maybeMap;
}
