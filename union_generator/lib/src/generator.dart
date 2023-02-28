import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:union/union.dart';

import 'config/union_config_reader.dart';
import 'template/union_template.dart';

class UnionGenerator extends GeneratorForAnnotation<UnionAnnotation> {
  UnionGenerator(this.options);

  final BuilderOptions options;

  @override
  String? generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final config = UnionConfigReader(element, annotation).read();
    return UnionTemplate(config).generate();
  }
}
