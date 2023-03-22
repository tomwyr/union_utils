import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

class UnknownAnnotationError extends Error {
  UnknownAnnotationError({
    required this.annotationType,
  });

  final String annotationType;

  @override
  String toString() => 'The annotation $annotationType is not supported.';
}

class InvalidAnnotationTargetError extends Error {
  InvalidAnnotationTargetError({
    required this.annotationType,
    required this.targetType,
  });

  final String annotationType;
  final String targetType;

  @override
  String toString() => 'The union annotation $annotationType cannot be used on $targetType.';
}

class UnknownUnionDeclarationError extends Error {
  UnknownUnionDeclarationError({
    required this.declarationType,
  });

  final Type declarationType;

  @override
  String toString() => 'The union declaration $declarationType is not supported.';
}

class DuplicatedUnionCaseNameError extends Error {
  DuplicatedUnionCaseNameError({
    required this.target,
    required this.name,
  });

  final Element target;
  final String name;

  @override
  String toString() => 'The union ${target.displayName} has a duplicated case: $name.';
}

class NotUnionSubtypeError extends Error {
  NotUnionSubtypeError({
    required this.target,
    required this.type,
  });

  final Element target;
  final DartType type;

  @override
  String toString() =>
      'The type ${type.element?.displayName} is not a subtype of the union ${target.displayName}.';
}

class NotEnumUnionCaseError extends Error {
  NotEnumUnionCaseError({
    required this.target,
    required this.value,
  });

  final Element target;
  final DartObject value;

  @override
  String toString() => 'The value $value is not a case of the union ${target.displayName}.';
}

class InvalidBuildConfigError extends Error {
  InvalidBuildConfigError(this.errorCause);

  final Object errorCause;

  @override
  String toString() => 'An error occurred while parsing the build.yaml configuration:\n$errorCause';
}

class UnexpectedBuildConfigError extends Error {
  UnexpectedBuildConfigError(this.unexpectedConfig);

  final Map<String, dynamic> unexpectedConfig;

  @override
  String toString() =>
      'Unexpected values found in the build.yaml configuration:\n$unexpectedConfig';
}
