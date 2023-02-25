import 'package:union/union.dart';

import 'animal.dart';
import 'flightless.dart';

part 'bird.g.dart';

@Union.of([
  Eagle,
  Flightless,
])
abstract class Bird implements Animal {}

class Eagle extends Bird {
  String get wingsColor => 'Brown';
}
