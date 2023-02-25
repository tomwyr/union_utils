import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:union/union.dart';

import 'config.dart';
import 'template.dart';

class UnionGenerator extends GeneratorForAnnotation<UnionAnnotation> {
  UnionGenerator(this.options);

  final BuilderOptions options;

  @override
  String? generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    return UnionConfigReader(element, annotation).read().toTemplate().generate();
  }
}

extension on UnionConfig {
  UnionFileTemplate toTemplate() => UnionFileTemplate(this);
}
