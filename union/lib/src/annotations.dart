import 'package:meta/meta_meta.dart';

import 'cases.dart';
import 'params.dart';
import 'utilities.dart';

@Target({
  TargetKind.classType,
  TargetKind.enumType,
  TargetKind.extension,
})
abstract class Union {
  const Union._({
    this.paramsType = UnionParamsType.named,
    this.utilities = const UnionUtilities.all(),
  });

  /// An annotation that marks the targeted class to be a union of [types], for
  /// which the generator should produce utilities. All provided [types] must
  /// be subtypes of the union type.
  const factory Union.of(
    Set<Type> types, {
    UnionParamsType paramsType,
    UnionUtilities utilities,
  }) = ClassTypesUnion;

  /// An annotation that marks the targeted class to be a union of [cases]
  /// types, for which the generator should produce utilities. All provided
  /// types must be subtypes of the union type. It is an error to provide more
  /// than one case for a specific type.
  const factory Union.ofCases(
    Set<TypeCase> cases, {
    UnionParamsType paramsType,
    UnionUtilities utilities,
  }) = ClassTypeCasesUnion;

  /// An annotation that marks the targeted enum to be a union of its cases,
  /// for which the generator should produce utilities.
  const factory Union.ofEnum({
    Set<Enum>? values,
    UnionParamsType paramsType,
    UnionUtilities utilities,
  }) = EnumUnion;

  /// An annotation that marks the targeted enum to be a union of its cases,
  /// for which the generator should produce utilities.
  const factory Union.ofEnumCases(
    Set<EnumCase> casaes, {
    UnionParamsType paramsType,
    UnionUtilities utilities,
  }) = EnumCasesUnion;

  /// The type of parameters that should be generated for the union.
  ///
  /// Defaults to [UnionParamsType.named]
  final UnionParamsType paramsType;

  /// The utilities that should be generated for the union.
  ///
  /// Defaults to [UnionUtilities.all].
  final UnionUtilities utilities;
}

class ClassTypesUnion extends Union {
  const ClassTypesUnion(
    this.types, {
    super.paramsType,
    super.utilities,
  }) : super._();

  final Set<Type> types;
}

class ClassTypeCasesUnion extends Union {
  const ClassTypeCasesUnion(
    this.cases, {
    super.paramsType,
    super.utilities,
  }) : super._();

  final Set<TypeCase> cases;
}

class EnumUnion extends Union {
  const EnumUnion({
    this.values,
    super.paramsType,
    super.utilities,
  }) : super._();

  final Set<Enum>? values;
}

class EnumCasesUnion extends Union {
  const EnumCasesUnion(
    this.cases, {
    super.paramsType,
    super.utilities,
  }) : super._();

  final Set<EnumCase> cases;
}
