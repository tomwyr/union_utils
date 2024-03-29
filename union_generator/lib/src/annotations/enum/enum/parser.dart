import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:collection/collection.dart';
import 'package:source_gen/source_gen.dart';

import '../../common/annotation_parser.dart';
import '../../common/parser_mixin.dart';
import 'declaration.dart';

class EnumUnionParser
    with UnionParserMixin<EnumElement>
    implements AnnotationParser<EnumUnionDeclaration> {
  @override
  EnumUnionDeclaration parse(Element element, ConstantReader annotation) {
    final targetElement = getTargetElement(element, annotation);
    final paramsType = getParamsType(annotation);
    final utilities = getUtilities(annotation);
    final values = _getValues(targetElement, annotation);

    return EnumUnionDeclaration(targetElement, paramsType, utilities, values);
  }

  Set<DartObject> _getValues(
      EnumElement targetElement, ConstantReader annotation) {
    final valuesReader = annotation.read('values');

    if (valuesReader.isNull) {
      return targetElement.fields
          .whereNot((field) => field.name == 'values')
          .map((field) => field.computeConstantValue()!)
          .toSet();
    }

    return valuesReader.setValue;
  }
}
