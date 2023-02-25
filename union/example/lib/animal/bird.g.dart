// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bird.dart';

// **************************************************************************
// UnionGenerator
// **************************************************************************

extension BirdUnion on Bird {
  T map<T>({
    required T Function(Eagle eagle) eagle,
    required T Function(Flightless flightless) flightless,
  }) {
    if (this is Eagle) {
      return eagle(this as Eagle);
    }
    if (this is Flightless) {
      return flightless(this as Flightless);
    }

    throw UnknownUnionCaseError(
      unionName: 'Bird',
      unionCase: this,
    );
  }
}
