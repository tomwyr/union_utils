import 'package:analyzer/dart/element/element.dart';

abstract class UnionDeclaration<T extends Element> {
  const UnionDeclaration(this.target);

  final T target;
}
