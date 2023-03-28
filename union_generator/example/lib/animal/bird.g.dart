// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bird.dart';

// **************************************************************************
// UnionGenerator
// **************************************************************************

extension BirdUnion on Bird {
  Eagle get asEagle =>
      this is Eagle ? this as Eagle : throw _getInvalidCastError(Eagle);
  Flightless get asFlightless => this is Flightless
      ? this as Flightless
      : throw _getInvalidCastError(Flightless);

  InvalidUnionCastError _getInvalidCastError(Type expectedCase) =>
      InvalidUnionCastError(
        unionName: 'Bird',
        expectedCase: expectedCase,
        actualCase: runtimeType,
      );

  Eagle? get asEagleOrNull => this is Eagle ? this as Eagle : null;
  Flightless? get asFlightlessOrNull =>
      this is Flightless ? this as Flightless : null;

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
      unionCase: runtimeType,
    );
  }

  T? mapOrNull<T>({
    T Function(Eagle eagle)? eagle,
    T Function(Flightless flightless)? flightless,
  }) {
    if (this is Eagle) {
      return eagle?.call(this as Eagle);
    }
    if (this is Flightless) {
      return flightless?.call(this as Flightless);
    }

    throw UnknownUnionCaseError(
      unionName: 'Bird',
      unionCase: runtimeType,
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
      unionCase: runtimeType,
    );
  }
}
