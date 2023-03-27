import 'package:union_annotation/union_annotation.dart';

import 'animal.dart';
import 'flightless.dart';

part 'bird.g.dart';

@Union.of(
  types: {
    Eagle,
    Flightless,
  },
)
abstract class Bird implements Animal {}

class Eagle extends Bird {
  String get wingsColor => 'Brown';
}
