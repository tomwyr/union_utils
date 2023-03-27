import 'package:analyzer/dart/element/element.dart';
import 'package:union_annotation/union_annotation.dart';

abstract class UnionDeclaration<T extends Element> {
  const UnionDeclaration(
    this.target,
    this.paramsType,
    this.utilities,
  );

  final T target;
  final UnionParamsType? paramsType;
  final UnionUtilities? utilities;
}
