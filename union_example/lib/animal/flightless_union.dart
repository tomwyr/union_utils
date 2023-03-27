import 'package:union_annotation/union_annotation.dart';

import 'flightless.dart';

part 'flightless_union.g.dart';

@Union.ofEnum()
extension on Flightless {}
