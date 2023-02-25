// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flightless_union.dart';

// **************************************************************************
// UnionGenerator
// **************************************************************************

extension FlightlessUnion on Flightless {
  T map<T>({
    required T Function() emu,
    required T Function() chicken,
    required T Function() kiwi,
  }) {
    if (this == Flightless.emu) {
      return emu();
    }
    if (this == Flightless.chicken) {
      return chicken();
    }
    if (this == Flightless.kiwi) {
      return kiwi();
    }

    throw UnknownUnionCaseError(
      unionName: 'Flightless',
      unionCase: this,
    );
  }
}
