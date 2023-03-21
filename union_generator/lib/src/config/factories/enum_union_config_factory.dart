import '../../common/declarations/enum_declarations.dart';
import '../union_case_config.dart';
import '../union_config.dart';
import '../union_type.dart';
import '../union_utilities.dart';

class EnumUnionConfigFactory {
  static UnionConfig createEnumConfig(
    EnumUnionDeclaration declaration,
    String unionName,
    UnionUtilities utilities,
  ) {
    final typeName = declaration.target.displayName;
    final unionCases = declaration.values.map((value) {
      final fieldName = value.variable!.name;
      final caseValue = '$typeName.$fieldName';
      final paramName = UnionParamName(fieldName);

      return UnionCaseConfig(
        caseValue: caseValue,
        paramName: paramName,
      );
    });

    return UnionConfig(
      unionName: unionName,
      unionType: UnionType.enumUnion,
      unionCases: unionCases,
      utilities: utilities,
      paramsType: declaration.paramsType,
    );
  }

  static UnionConfig createEnumCasesConfig(
    EnumCasesUnionDeclaration declaration,
    String unionName,
    UnionUtilities utilities,
  ) {
    final typeName = declaration.target.displayName;
    final unionCases = declaration.cases.map((caseDeclaration) {
      final enumField = declaration.target.fields.firstWhere(
        (field) => field.name == caseDeclaration.value.variable!.name,
      );

      final fieldName = enumField.name;
      final caseValue = '$typeName.$fieldName';
      final paramName = UnionParamName(caseDeclaration.name ?? enumField.name);

      return UnionCaseConfig(
        caseValue: caseValue,
        paramName: paramName,
      );
    });

    return UnionConfig(
      unionName: unionName,
      unionType: UnionType.enumUnion,
      unionCases: unionCases,
      utilities: utilities,
      paramsType: declaration.paramsType,
    );
  }
}
