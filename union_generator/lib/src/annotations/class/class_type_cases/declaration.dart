import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../../union/declaration.dart';

class ClassTypeCasesUnionDeclaration extends UnionDeclaration<ClassElement> {
  const ClassTypeCasesUnionDeclaration(
    super.target,
    super.paramsType,
    super.utilities,
    this.cases,
  );

  final Set<TypeCaseDeclaration> cases;
}

class TypeCaseDeclaration {
  TypeCaseDeclaration({
    required this.type,
    required this.name,
  });

  final DartType type;
  final String? name;
}
