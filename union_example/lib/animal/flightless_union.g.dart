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

  T maybeMap<T>({
    T Function()? emu,
    T Function()? chicken,
    T Function()? kiwi,
    required T Function() orElse,
  }) {
    if (this == Flightless.emu) {
      return emu != null ? emu() : orElse();
    }
    if (this == Flightless.chicken) {
      return chicken != null ? chicken() : orElse();
    }
    if (this == Flightless.kiwi) {
      return kiwi != null ? kiwi() : orElse();
    }

    throw UnknownUnionCaseError(
      unionName: 'Flightless',
      unionCase: this,
    );
  }
}
