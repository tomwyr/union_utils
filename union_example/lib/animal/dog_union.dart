import 'package:union/union.dart';

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
