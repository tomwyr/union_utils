import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';

import 'union_declaration.dart';

class EnumUnionDeclaration extends UnionDeclaration<EnumElement> {
  const EnumUnionDeclaration(
    super.target,
    super.paramsType,
    super.utilities,
    this.values,
  );

  final Set<DartObject> values;
}

class EnumCasesUnionDeclaration extends UnionDeclaration<EnumElement> {
  const EnumCasesUnionDeclaration(
    super.target,
    super.paramsType,
    super.utilities,
    this.cases,
  );

  final Set<EnumCaseDeclaration> cases;
}

class EnumCaseDeclaration {
  EnumCaseDeclaration({
    required this.value,
    required this.name,
  });

  final DartObject value;
  final String? name;
}
