// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// UnionGenerator
// **************************************************************************

extension AnimalUnion on Animal {
  T map<T>({
    required T Function(Bird bird) bird,
    required T Function(Cat cat) cat,
    required T Function(Dog dog) dog,
    required T Function(Fish fish) fish,
    required T Function(Reptile reptile) reptile,
  }) {
    if (this is Bird) {
      return bird(this as Bird);
    }
    if (this is Cat) {
      return cat(this as Cat);
    }
    if (this is Dog) {
      return dog(this as Dog);
    }
    if (this is Fish) {
      return fish(this as Fish);
    }
    if (this is Reptile) {
      return reptile(this as Reptile);
    }

    throw UnknownUnionCaseError(
      unionName: 'Animal',
      unionCase: this,
    );
  }
}
