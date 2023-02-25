import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'generator.dart';

Builder unionBuilder(BuilderOptions options) => SharedPartBuilder(
      [UnionGenerator(options)],
      'union',
    );
