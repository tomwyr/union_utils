import 'animal.dart';

abstract class Dog extends Animal {}

class Beagle extends Dog {
  int get age => 5;
}

class GoldenRetriever extends Dog {
  bool get friendly => true;
}

class BorderCollie extends Dog {
  String get sound => 'Woof';
}
