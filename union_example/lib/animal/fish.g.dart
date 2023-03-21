// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fish.dart';

// **************************************************************************
// UnionGenerator
// **************************************************************************

extension FishUnion on Fish {
  Shark get asJaws => this is Shark ? this as Shark : throw _getInvalidCastError(Shark);
  Goldfish get asNemo => this is Goldfish ? this as Goldfish : throw _getInvalidCastError(Goldfish);
  Piranha get asPiranha => this is Piranha ? this as Piranha : throw _getInvalidCastError(Piranha);

  InvalidUnionCastError _getInvalidCastError(Type expectedCase) => InvalidUnionCastError(
        unionName: 'Fish',
        expectedCase: expectedCase,
        actualCase: runtimeType,
      );

  Shark? get asJawsOrNull => this is Shark ? this as Shark : null;
  Goldfish? get asNemoOrNull => this is Goldfish ? this as Goldfish : null;
  Piranha? get asPiranhaOrNull => this is Piranha ? this as Piranha : null;

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
      unionCase: runtimeType,
    );
  }

  T? mapOrNull<T>({
    T Function(Shark jaws)? jaws,
    T Function(Goldfish nemo)? nemo,
    T Function(Piranha piranha)? piranha,
  }) {
    if (this is Shark) {
      return jaws?.call(this as Shark);
    }
    if (this is Goldfish) {
      return nemo?.call(this as Goldfish);
    }
    if (this is Piranha) {
      return piranha?.call(this as Piranha);
    }

    throw UnknownUnionCaseError(
      unionName: 'Fish',
      unionCase: runtimeType,
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
      unionCase: runtimeType,
    );
  }
}
