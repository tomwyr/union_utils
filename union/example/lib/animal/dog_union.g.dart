// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_union.dart';

// **************************************************************************
// UnionGenerator
// **************************************************************************

extension DogUnion on Dog {
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
      unionCase: this,
    );
  }
}
