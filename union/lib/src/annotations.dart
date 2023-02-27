import 'package:meta/meta_meta.dart';

/// Base interface for union annotations.
abstract class UnionAnnotation {
  UnionAnnotation._();
}

@Target({
  TargetKind.classType,
  TargetKind.extension,
})

/// An annotation that marks a class to be a union type for which the generator
/// should produce the utilities.
class Union implements UnionAnnotation {
  /// Annotates class to be a union of given [types].
  const Union.of(this.types);

  /// Types that should be considered cases of the corresponding union class.
  /// Must be subtypes of the union type.
  final List<Type> types;
}

@Target({
  TargetKind.enumType,
  TargetKind.extension,
})

/// An annotation that marks a class to be a union type for which the generator
/// should produce the utilities.
class EnumUnion implements UnionAnnotation {
  /// Annotates enum to be a union of its values.
  const EnumUnion();
}
