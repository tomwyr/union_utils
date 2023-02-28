enum UnionType {
  classUnion,
  enumUnion,
}

class UnionConfig {
  UnionConfig({
    required this.unionName,
    required this.unionCases,
    required this.unionType,
    required this.utilities,
  });

  final String unionName;
  final Iterable<String> unionCases;
  final UnionType unionType;
  final UnionUtilities utilities;
}

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
