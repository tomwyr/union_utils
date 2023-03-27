import 'package:union/union.dart';

import 'bear.dart';
import 'bird.dart';
import 'cat.dart';
import 'dog.dart';
import 'fish.dart';
import 'horse.dart';
import 'reptile.dart';

part 'animal.g.dart';

@Union.of(
  types: {
    Bird,
    Cat,
    Dog,
    Fish,
    Reptile,
    Horse,
    Bear,
  },
)
abstract class Animal {}
