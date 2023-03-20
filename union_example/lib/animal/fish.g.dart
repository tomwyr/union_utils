// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fish.dart';

// **************************************************************************
// UnionGenerator
// **************************************************************************

extension FishUnion on Fish {
  T map<T>({
    required T Function(Shark jaws) jaws,
    required T Function(Goldfish nemo) nemo,
    required T Function(Piranha piranha) piranha,
  }) {
    if (this is Shark) {
      return jaws(this as Shark);
    }
    if (this is Goldfish) {
      return nemo(this as Goldfish);
    }
    if (this is Piranha) {
      return piranha(this as Piranha);
    }

    throw UnknownUnionCaseError(
      unionName: 'Fish',
      unionCase: this,
    );
  }

  T maybeMap<T>({
    T Function(Shark jaws)? jaws,
    T Function(Goldfish nemo)? nemo,
    T Function(Piranha piranha)? piranha,
    required T Function() orElse,
  }) {
    if (this is Shark) {
      return jaws != null ? jaws(this as Shark) : orElse();
    }
    if (this is Goldfish) {
      return nemo != null ? nemo(this as Goldfish) : orElse();
    }
    if (this is Piranha) {
      return piranha != null ? piranha(this as Piranha) : orElse();
    }

    throw UnknownUnionCaseError(
      unionName: 'Fish',
      unionCase: this,
    );
  }
}
