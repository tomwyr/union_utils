import 'package:union/union.dart';

import 'bird.dart';
import 'cat.dart';
import 'dog.dart';
import 'fish.dart';
import 'reptile.dart';

part 'animal.g.dart';

@Union.of([
  Bird,
  Cat,
  Dog,
  Fish,
  Reptile,
])
abstract class Animal {}
