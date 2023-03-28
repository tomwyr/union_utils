import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'generator.dart';

/// Creates a builder that generates union utilities.
Builder unionGenerator(BuilderOptions options) => SharedPartBuilder(
      [UnionGenerator(options)],
      'union_generator',
    );
