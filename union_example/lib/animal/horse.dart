import 'package:union/union.dart';

import 'animal.dart';

part 'horse.g.dart';

@Union.ofEnumCases({
  EnumCase(value: Horse.arabian, name: 'andy'),
  EnumCase(value: Horse.warmblood, name: 'shawn'),
  EnumCase(value: Horse.mustang, name: 'bob'),
})
enum Horse implements Animal {
  arabian,
  warmblood,
  mustang,
}
