import 'animal/animal.dart';
import 'animal/bear.dart';
import 'animal/bird.dart';
import 'animal/cat.dart';
import 'animal/dog_union.dart';
import 'animal/fish.dart';
import 'animal/flightless_union.dart';
import 'animal/horse.dart';
import 'animal/reptile.dart';

void main() {
  print(describe(Cat()));
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
    fish: (fish) => fish.map(
      jaws: (jaws) => 'Does shark eat humans: ${jaws.eatsHumans}',
      nemo: (nemo) => 'Does goldfish humans: ${nemo.eatsHumans}',
      piranha: (piranha) => 'Does piranha eat humans: ${piranha.eatsHumans}',
    ),
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
    horse: (horse) => horse.map(
      andy: () => '🐴 Andy',
      shawn: () => '🐴 Shawn',
      bob: () => '🐴 Bob',
    ),
    bear: (bear) => bear.map(
      polarBear: (polarBear) => 'White and huge',
      grizzlyBear: (grizzlyBear) => 'Brown and dangerous',
      blackBear: (blackBear) => 'Small but dangerous',
      pandaBear: (pandaBear) => 'Nice and cute',
    ),
  );

  return '$type > $info';
}

extension on String {
  String capitalize() {
    if (isEmpty) return '';
    return this[0].toUpperCase() + substring(1);
  }
}
