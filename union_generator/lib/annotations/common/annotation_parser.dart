import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

abstract class AnnotationParser<T> {
  T parse(Element element, ConstantReader annotation);
}
