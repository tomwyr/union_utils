import 'package:union/union.dart';

import 'animal.dart';

part 'reptile.g.dart';

@EnumUnion()
enum Reptile implements Animal {
  snake,
  turtle,
  lizard,
}
