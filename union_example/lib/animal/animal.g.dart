// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// UnionGenerator
// **************************************************************************

extension AnimalUnion on Animal {
  Bird get asBird => this as Bird;
  Cat get asCat => this as Cat;
  Dog get asDog => this as Dog;
  Fish get asFish => this as Fish;
  Reptile get asReptile => this as Reptile;
  Horse get asHorse => this as Horse;

  Bird? get asBirdOrNull => this is Bird ? this as Bird : null;
  Cat? get asCatOrNull => this is Cat ? this as Cat : null;
  Dog? get asDogOrNull => this is Dog ? this as Dog : null;
  Fish? get asFishOrNull => this is Fish ? this as Fish : null;
  Reptile? get asReptileOrNull => this is Reptile ? this as Reptile : null;
  Horse? get asHorseOrNull => this is Horse ? this as Horse : null;

  T map<T>({
    required T Function(Bird bird) bird,
    required T Function(Cat cat) cat,
    required T Function(Dog dog) dog,
    required T Function(Fish fish) fish,
    required T Function(Reptile reptile) reptile,
    required T Function(Horse horse) horse,
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
    if (this is Horse) {
      return horse(this as Horse);
    }

    throw UnknownUnionCaseError(
      unionName: 'Animal',
      unionCase: this,
    );
  }

  T? mapOrNull<T>({
    T Function(Bird bird)? bird,
    T Function(Cat cat)? cat,
    T Function(Dog dog)? dog,
    T Function(Fish fish)? fish,
    T Function(Reptile reptile)? reptile,
    T Function(Horse horse)? horse,
  }) {
    if (this is Bird) {
      return bird?.call(this as Bird);
    }
    if (this is Cat) {
      return cat?.call(this as Cat);
    }
    if (this is Dog) {
      return dog?.call(this as Dog);
    }
    if (this is Fish) {
      return fish?.call(this as Fish);
    }
    if (this is Reptile) {
      return reptile?.call(this as Reptile);
    }
    if (this is Horse) {
      return horse?.call(this as Horse);
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
    T Function(Horse horse)? horse,
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
    if (this is Horse) {
      return horse != null ? horse(this as Horse) : orElse();
    }

    throw UnknownUnionCaseError(
      unionName: 'Animal',
      unionCase: this,
    );
  }
}
