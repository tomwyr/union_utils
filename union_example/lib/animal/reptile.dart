import 'package:union/union.dart';

import 'animal.dart';

part 'reptile.g.dart';

@Union.ofEnum()
enum Reptile implements Animal {
  snake,
  turtle,
  lizard,
}
