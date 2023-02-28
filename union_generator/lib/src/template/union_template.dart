import '../config/union_config.dart';
import 'class_template.dart';
import 'enum_template.dart';
import 'template.dart';

class UnionTemplate extends Template {
  UnionTemplate(this.config);

  final UnionConfig config;

  String generate() {
    switch (config.unionType) {
      case UnionType.classUnion:
        return ClassUnionTemplate(config).generate();
      case UnionType.enumUnion:
        return EnumUnionTemplate(config).generate();
    }
  }
}
