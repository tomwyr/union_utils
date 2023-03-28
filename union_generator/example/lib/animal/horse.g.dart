// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'horse.dart';

// **************************************************************************
// UnionGenerator
// **************************************************************************

extension HorseUnion on Horse {
  T map<T>({
    required T Function() andy,
    required T Function() shawn,
    required T Function() bob,
  }) {
    if (this == Horse.arabian) {
      return andy();
    }
    if (this == Horse.warmblood) {
      return shawn();
    }
    if (this == Horse.mustang) {
      return bob();
    }

    throw UnknownUnionCaseError(
      unionName: 'Horse',
      unionCase: runtimeType,
    );
  }

  T? mapOrNull<T>({
    T Function()? andy,
    T Function()? shawn,
    T Function()? bob,
  }) {
    if (this == Horse.arabian) {
      return andy?.call();
    }
    if (this == Horse.warmblood) {
      return shawn?.call();
    }
    if (this == Horse.mustang) {
      return bob?.call();
    }

    throw UnknownUnionCaseError(
      unionName: 'Horse',
      unionCase: runtimeType,
    );
  }

  T maybeMap<T>({
    T Function()? andy,
    T Function()? shawn,
    T Function()? bob,
    required T Function() orElse,
  }) {
    if (this == Horse.arabian) {
      return andy != null ? andy() : orElse();
    }
    if (this == Horse.warmblood) {
      return shawn != null ? shawn() : orElse();
    }
    if (this == Horse.mustang) {
      return bob != null ? bob() : orElse();
    }

    throw UnknownUnionCaseError(
      unionName: 'Horse',
      unionCase: runtimeType,
    );
  }
}
