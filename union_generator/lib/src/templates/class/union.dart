import '../../annotations/union/config.dart';
import '../common/template.dart';
import '../common/template_mixin.dart';
import 'as_type.dart';
import 'as_type_or_null.dart';
import 'map.dart';
import 'map_or_null.dart';
import 'maybe_map.dart';

class ClassUnionTemplate extends Template with UnionTemplateMixin {
  ClassUnionTemplate(this.config);

  final UnionConfig config;

  @override
  String generate() {
    final utilities = <Template>[
      if (config.generateAsType) ClassAsTypeTemplate(config),
      if (config.generateAsTypeOrNull) ClassAsTypeOrNullTemplate(config),
      if (config.generateMap) ClassMapTemplate(config),
      if (config.generateMapOrNull) ClassMapOrNullTemplate(config),
      if (config.generateMaybeMap) ClassMaybeMapTemplate(config),
    ].map((template) => template.generate());

    return getUnionExtension(
      utilities: utilities,
      config: config,
    );
  }
}
