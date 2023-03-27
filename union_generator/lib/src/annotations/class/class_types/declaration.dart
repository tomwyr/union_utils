import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../../union/declaration.dart';

class ClassTypesUnionDeclaration extends UnionDeclaration<ClassElement> {
  const ClassTypesUnionDeclaration(
    super.target,
    super.paramsType,
    super.utilities,
    this.types,
  );

  final Set<DartType> types;
}
