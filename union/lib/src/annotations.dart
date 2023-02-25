import 'package:meta/meta_meta.dart';

abstract class UnionAnnotation {
  UnionAnnotation._();
}

@Target({
  TargetKind.classType,
  TargetKind.extension,
})
class Union implements UnionAnnotation {
  const Union.of(this.types);

  final List<Type> types;
}

@Target({
  TargetKind.enumType,
  TargetKind.extension,
})
class EnumUnion implements UnionAnnotation {
  const EnumUnion();
}
