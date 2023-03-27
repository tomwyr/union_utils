import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:union/union.dart';

import 'annotations/union/config.dart';
import 'annotations/union/parser.dart';
import 'build_config/build_config.dart';
import 'templates/union.dart';

class UnionGenerator extends GeneratorForAnnotation<Union> {
  UnionGenerator(this.options);

  final BuilderOptions options;

  @override
  String? generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final buildConfig = UnionBuildConfig.fromOptions(options);
    final declaration = UnionParser().parse(element, annotation);
    final config = UnionConfig.create(declaration, buildConfig);
    return UnionTemplate(config).generate();
  }
}
