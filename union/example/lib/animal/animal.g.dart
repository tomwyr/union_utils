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

  T maybeMap<T>({
    T Function(Bird bird)? bird,
    T Function(Cat cat)? cat,
    T Function(Dog dog)? dog,
    T Function(Fish fish)? fish,
    T Function(Reptile reptile)? reptile,
    required T Function() orElse,
  }) {
    if (this is Bird) {
      return bird != null ? bird(this as Bird) : orElse();
    }
    if (this is Cat) {
      return cat != null ? cat(this as Cat) : orElse();
    }
    if (this is Dog) {
      return dog != null ? dog(this as Dog) : orElse();
    }
    if (this is Fish) {
      return fish != null ? fish(this as Fish) : orElse();
    }
    if (this is Reptile) {
      return reptile != null ? reptile(this as Reptile) : orElse();
    }

    throw UnknownUnionCaseError(
      unionName: 'Animal',
      unionCase: this,
    );
  }
}
