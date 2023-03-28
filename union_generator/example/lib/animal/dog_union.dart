import 'package:union_annotation/union_annotation.dart';

import 'dog.dart';

part 'dog_union.g.dart';

@Union.of(
  types: {
    Beagle,
    GoldenRetriever,
    BorderCollie,
  },
)
extension on Dog {}
