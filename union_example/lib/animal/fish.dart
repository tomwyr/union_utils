import 'package:union/union.dart';

import 'animal.dart';

part 'fish.g.dart';

@Union.ofCases({
  TypeCase(type: Shark, name: 'Jaws'),
  TypeCase(type: Goldfish, name: 'Nemo'),
  TypeCase(type: Piranha),
})
abstract class Fish extends Animal {
  bool get eatsHumans;
}

class Shark extends Fish {
  @override
  bool get eatsHumans => true;
}

class Goldfish extends Fish {
  @override
  bool get eatsHumans => false;
}

class Piranha extends Fish {
  @override
  bool get eatsHumans => true;
}
