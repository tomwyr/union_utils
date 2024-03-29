// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_union.dart';

// **************************************************************************
// UnionGenerator
// **************************************************************************

extension DogUnion on Dog {
  Beagle get asBeagle =>
      this is Beagle ? this as Beagle : throw _getInvalidCastError(Beagle);
  GoldenRetriever get asGoldenRetriever => this is GoldenRetriever
      ? this as GoldenRetriever
      : throw _getInvalidCastError(GoldenRetriever);
  BorderCollie get asBorderCollie => this is BorderCollie
      ? this as BorderCollie
      : throw _getInvalidCastError(BorderCollie);

  InvalidUnionCastError _getInvalidCastError(Type expectedCase) =>
      InvalidUnionCastError(
        unionName: 'Dog',
        expectedCase: expectedCase,
        actualCase: runtimeType,
      );

  Beagle? get asBeagleOrNull => this is Beagle ? this as Beagle : null;
  GoldenRetriever? get asGoldenRetrieverOrNull =>
      this is GoldenRetriever ? this as GoldenRetriever : null;
  BorderCollie? get asBorderCollieOrNull =>
      this is BorderCollie ? this as BorderCollie : null;

  T map<T>({
    required T Function(Beagle beagle) beagle,
    required T Function(GoldenRetriever goldenRetriever) goldenRetriever,
    required T Function(BorderCollie borderCollie) borderCollie,
  }) {
    if (this is Beagle) {
      return beagle(this as Beagle);
    }
    if (this is GoldenRetriever) {
      return goldenRetriever(this as GoldenRetriever);
    }
    if (this is BorderCollie) {
      return borderCollie(this as BorderCollie);
    }

    throw UnknownUnionCaseError(
      unionName: 'Dog',
      unionCase: runtimeType,
    );
  }

  T? mapOrNull<T>({
    T Function(Beagle beagle)? beagle,
    T Function(GoldenRetriever goldenRetriever)? goldenRetriever,
    T Function(BorderCollie borderCollie)? borderCollie,
  }) {
    if (this is Beagle) {
      return beagle?.call(this as Beagle);
    }
    if (this is GoldenRetriever) {
      return goldenRetriever?.call(this as GoldenRetriever);
    }
    if (this is BorderCollie) {
      return borderCollie?.call(this as BorderCollie);
    }

    throw UnknownUnionCaseError(
      unionName: 'Dog',
      unionCase: runtimeType,
    );
  }

  T maybeMap<T>({
    T Function(Beagle beagle)? beagle,
    T Function(GoldenRetriever goldenRetriever)? goldenRetriever,
    T Function(BorderCollie borderCollie)? borderCollie,
    required T Function() orElse,
  }) {
    if (this is Beagle) {
      return beagle != null ? beagle(this as Beagle) : orElse();
    }
    if (this is GoldenRetriever) {
      return goldenRetriever != null
          ? goldenRetriever(this as GoldenRetriever)
          : orElse();
    }
    if (this is BorderCollie) {
      return borderCollie != null
          ? borderCollie(this as BorderCollie)
          : orElse();
    }

    throw UnknownUnionCaseError(
      unionName: 'Dog',
      unionCase: runtimeType,
    );
  }
}
