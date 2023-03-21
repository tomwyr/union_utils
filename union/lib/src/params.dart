/// The type of parameters used by the generated utilities for annotated
/// unions.
enum UnionParamsType {
  /// The parameters will be named according to the types, values or names of
  /// declared union cases.
  named,

  /// The parameters will be positional and ordered according to the order of
  /// declared union cases.
  positional,
}
