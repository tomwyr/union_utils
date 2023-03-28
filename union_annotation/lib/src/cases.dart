/// A configuration for a union case of given class [type].
class TypeCase {
  /// Creates a new instance of [TypeCase].
  const TypeCase({
    required this.type,
    this.name,
  });

  /// Class type that represents the union case.
  final Type type;

  /// Alias name for the union type used in place of the original type
  /// during the code generation.
  final String? name;
}

/// A configuration for a union case of given enum [value].
class EnumCase {
  /// Creates a new instance of [EnumCase].
  const EnumCase({
    required this.value,
    this.name,
  });

  /// Enum value that represents the union case.
  final Enum value;

  /// Alias name for the union type used in place of the original type
  /// during the code generation.
  final String? name;
}
