import 'package:union_annotation/union_annotation.dart';

import 'animal.dart';

part 'bear.g.dart';

@Union.of()
abstract class Bear implements Animal {}

class PolarBear extends Bear {}

class GrizzlyBear extends Bear {}

class BlackBear extends Bear {}

class PandaBear extends Bear {}
