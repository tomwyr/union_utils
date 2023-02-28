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

  T maybeMap<T>({
    T Function(Eagle eagle)? eagle,
    T Function(Flightless flightless)? flightless,
    required T Function() orElse,
  }) {
    if (this is Eagle) {
      return eagle != null ? eagle(this as Eagle) : orElse();
    }
    if (this is Flightless) {
      return flightless != null ? flightless(this as Flightless) : orElse();
    }

    throw UnknownUnionCaseError(
      unionName: 'Bird',
      unionCase: this,
    );
  }
}
