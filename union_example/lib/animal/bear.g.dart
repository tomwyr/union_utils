// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bear.dart';

// **************************************************************************
// UnionGenerator
// **************************************************************************

extension BearUnion on Bear {
  PolarBear get asPolarBear => this is PolarBear
      ? this as PolarBear
      : throw _getInvalidCastError(PolarBear);
  GrizzlyBear get asGrizzlyBear => this is GrizzlyBear
      ? this as GrizzlyBear
      : throw _getInvalidCastError(GrizzlyBear);
  BlackBear get asBlackBear => this is BlackBear
      ? this as BlackBear
      : throw _getInvalidCastError(BlackBear);
  PandaBear get asPandaBear => this is PandaBear
      ? this as PandaBear
      : throw _getInvalidCastError(PandaBear);

  InvalidUnionCastError _getInvalidCastError(Type expectedCase) =>
      InvalidUnionCastError(
        unionName: 'Bear',
        expectedCase: expectedCase,
        actualCase: runtimeType,
      );

  PolarBear? get asPolarBearOrNull =>
      this is PolarBear ? this as PolarBear : null;
  GrizzlyBear? get asGrizzlyBearOrNull =>
      this is GrizzlyBear ? this as GrizzlyBear : null;
  BlackBear? get asBlackBearOrNull =>
      this is BlackBear ? this as BlackBear : null;
  PandaBear? get asPandaBearOrNull =>
      this is PandaBear ? this as PandaBear : null;

  T map<T>({
    required T Function(PolarBear polarBear) polarBear,
    required T Function(GrizzlyBear grizzlyBear) grizzlyBear,
    required T Function(BlackBear blackBear) blackBear,
    required T Function(PandaBear pandaBear) pandaBear,
  }) {
    if (this is PolarBear) {
      return polarBear(this as PolarBear);
    }
    if (this is GrizzlyBear) {
      return grizzlyBear(this as GrizzlyBear);
    }
    if (this is BlackBear) {
      return blackBear(this as BlackBear);
    }
    if (this is PandaBear) {
      return pandaBear(this as PandaBear);
    }

    throw UnknownUnionCaseError(
      unionName: 'Bear',
      unionCase: runtimeType,
    );
  }

  T? mapOrNull<T>({
    T Function(PolarBear polarBear)? polarBear,
    T Function(GrizzlyBear grizzlyBear)? grizzlyBear,
    T Function(BlackBear blackBear)? blackBear,
    T Function(PandaBear pandaBear)? pandaBear,
  }) {
    if (this is PolarBear) {
      return polarBear?.call(this as PolarBear);
    }
    if (this is GrizzlyBear) {
      return grizzlyBear?.call(this as GrizzlyBear);
    }
    if (this is BlackBear) {
      return blackBear?.call(this as BlackBear);
    }
    if (this is PandaBear) {
      return pandaBear?.call(this as PandaBear);
    }

    throw UnknownUnionCaseError(
      unionName: 'Bear',
      unionCase: runtimeType,
    );
  }

  T maybeMap<T>({
    T Function(PolarBear polarBear)? polarBear,
    T Function(GrizzlyBear grizzlyBear)? grizzlyBear,
    T Function(BlackBear blackBear)? blackBear,
    T Function(PandaBear pandaBear)? pandaBear,
    required T Function() orElse,
  }) {
    if (this is PolarBear) {
      return polarBear != null ? polarBear(this as PolarBear) : orElse();
    }
    if (this is GrizzlyBear) {
      return grizzlyBear != null ? grizzlyBear(this as GrizzlyBear) : orElse();
    }
    if (this is BlackBear) {
      return blackBear != null ? blackBear(this as BlackBear) : orElse();
    }
    if (this is PandaBear) {
      return pandaBear != null ? pandaBear(this as PandaBear) : orElse();
    }

    throw UnknownUnionCaseError(
      unionName: 'Bear',
      unionCase: runtimeType,
    );
  }
}
