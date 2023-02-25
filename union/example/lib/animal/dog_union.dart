import 'package:union/union.dart';

import 'dog.dart';

part 'dog_union.g.dart';

@Union.of([
  Beagle,
  GoldenRetriever,
  BorderCollie,
])
extension on Dog {}
