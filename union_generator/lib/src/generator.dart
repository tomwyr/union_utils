import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:union/union.dart';

import 'config/union_config.dart';
import 'parsers/union_parser.dart';
import 'templates/union_template.dart';

class UnionGenerator extends GeneratorForAnnotation<Union> {
  UnionGenerator(this.options);

  final BuilderOptions options;

  @override
  String? generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final declaration = UnionParser().parse(element, annotation);
    final config = UnionConfig.create(declaration);
    return UnionTemplate(config).generate();
  }
}
