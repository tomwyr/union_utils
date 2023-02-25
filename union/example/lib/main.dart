import 'dart:math';

import 'animal/animal.dart';
import 'animal/bird.dart';
import 'animal/cat.dart';
import 'animal/dog.dart';
import 'animal/dog_union.dart';
import 'animal/fish.dart';
import 'animal/flightless.dart';
import 'animal/flightless_union.dart';
import 'animal/reptile.dart';

void main() {
  for (var i = 0; i < 10; i++) {
    print(describe(getRandomAnimal()));
  }
}

String describe(Animal animal) {
  final type = animal is Enum ? (animal as Enum).name.capitalize() : animal.runtimeType;

  final info = animal.map(
    cat: (cat) => 'Lives: ${cat.lives}',
    dog: (dog) => dog.map(
      beagle: (beagle) => 'Age: ${beagle.age}',
      goldenRetriever: (goldenRetriever) => 'Friendly: ${goldenRetriever.friendly}',
      borderCollie: (borderCollie) => 'Sound: ${borderCollie.sound}',
    ),
    fish: (fish) => 'Eats humans: ${fish.eatsHumans}',
    reptile: (reptile) => reptile.map(
      lizard: () => '🦎',
      snake: () => '🐍',
      turtle: () => '🐢',
    ),
    bird: (bird) => bird.map(
      eagle: (eagle) => 'Wings color: ${eagle.wingsColor}',
      flightless: (flightless) => flightless.map(
        chicken: () => 'Tastes nice',
        emu: () => 'Quite fast',
        kiwi: () => 'Smol',
      ),
    ),
  );

  return '$type > $info';
}

Animal getRandomAnimal() {
  const animalTypes = 5;
  const dogTypes = 3;
  const reptileTypes = 3;
  const birdTypes = 2;
  const flightlessTypes = 3;

  final random = Random();

  switch (random.nextInt(animalTypes)) {
    case 0:
      return Cat();
    case 1:
      switch (random.nextInt(dogTypes)) {
        case 0:
          return Beagle();
        case 1:
          return GoldenRetriever();
        case 2:
          return BorderCollie();
      }
      break;
    case 2:
      return Fish();
    case 3:
      switch (random.nextInt(reptileTypes)) {
        case 0:
          return Reptile.lizard;
        case 1:
          return Reptile.snake;
        case 2:
          return Reptile.turtle;
      }
      break;
    case 4:
      switch (random.nextInt(birdTypes)) {
        case 0:
          return Eagle();
        case 1:
          switch (random.nextInt(flightlessTypes)) {
            case 0:
              return Flightless.chicken;
            case 1:
              return Flightless.emu;
            case 2:
              return Flightless.kiwi;
          }
      }
  }

  // ignore: deprecated_member_use
  throw FallThroughError();
}

extension on String {
  String capitalize() {
    if (isEmpty) return '';
    return this[0].toUpperCase() + substring(1);
  }
}
