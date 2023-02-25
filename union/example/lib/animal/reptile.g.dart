// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reptile.dart';

// **************************************************************************
// UnionGenerator
// **************************************************************************

extension ReptileUnion on Reptile {
  T map<T>({
    required T Function() snake,
    required T Function() turtle,
    required T Function() lizard,
  }) {
    if (this == Reptile.snake) {
      return snake();
    }
    if (this == Reptile.turtle) {
      return turtle();
    }
    if (this == Reptile.lizard) {
      return lizard();
    }

    throw UnknownUnionCaseError(
      unionName: 'Reptile',
      unionCase: this,
    );
  }
}
