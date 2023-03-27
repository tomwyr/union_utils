import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';

import '../../union/declaration.dart';

class EnumUnionDeclaration extends UnionDeclaration<EnumElement> {
  const EnumUnionDeclaration(
    super.target,
    super.paramsType,
    super.utilities,
    this.values,
  );

  final Set<DartObject> values;
}
