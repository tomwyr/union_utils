import '../../annotations/union/config.dart';
import '../common/template.dart';
import '../common/template_mixin.dart';
import 'map.dart';
import 'map_or_null.dart';
import 'maybe_map.dart';

class EnumUnionTemplate extends Template with UnionTemplateMixin {
  EnumUnionTemplate(this.config);

  final UnionConfig config;

  @override
  String generate() {
    final utilities = <Template>[
      if (config.generateMap) EnumMapTemplate(config),
      if (config.generateMapOrNull) EnumMapOrNullTemplate(config),
      if (config.generateMaybeMap) EnumMaybeMapTemplate(config),
    ].map((template) => template.generate());

    return getUnionExtension(
      utilities: utilities,
      config: config,
    );
  }
}
