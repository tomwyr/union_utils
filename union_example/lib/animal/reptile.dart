import 'package:union_annotation/union_annotation.dart';

import 'animal.dart';

part 'reptile.g.dart';

@Union.ofEnum()
enum Reptile implements Animal {
  snake,
  turtle,
  lizard,
}
