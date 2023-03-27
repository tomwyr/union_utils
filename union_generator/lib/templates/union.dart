import '../annotations/union/config.dart';
import 'class/union.dart';
import 'common/template.dart';
import 'enum/union.dart';

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
