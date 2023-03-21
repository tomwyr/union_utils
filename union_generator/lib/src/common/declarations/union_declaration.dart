import 'package:analyzer/dart/element/element.dart';
import 'package:union/union.dart';

abstract class UnionDeclaration<T extends Element> {
  const UnionDeclaration(
    this.target,
    this.paramsType,
  );

  final T target;
  final UnionParamsType paramsType;
}
