import '../../common/declarations/class_declarations.dart';
import '../union_case_config.dart';
import '../union_config.dart';
import '../union_type.dart';
import '../union_utilities.dart';

class ClassUnionConfigFactory {
  static UnionConfig createClassTypesConfig(
    ClassTypesUnionDeclaration declaration,
    String unionName,
    UnionUtilities utilities,
  ) {
    final unionCases = declaration.types.map((type) {
      final typeName = type.element!.displayName;
      final paramName = typeName.decapitalize();

      return UnionCaseConfig(
        caseValue: typeName,
        paramName: paramName,
      );
    });

    return UnionConfig(
      unionName: unionName,
      unionType: UnionType.classUnion,
      unionCases: unionCases,
      utilities: utilities,
    );
  }

  static UnionConfig createClassTypeCasesConfig(
    ClassTypeCasesUnionDeclaration declaration,
    String unionName,
    UnionUtilities utilities,
  ) {
    final unionCases = declaration.cases.map((caseDeclaration) {
      final typeName = caseDeclaration.type.element!.displayName;
      final paramName = (caseDeclaration.name ?? typeName).decapitalize();

      return UnionCaseConfig(
        caseValue: typeName,
        paramName: paramName,
      );
    });

    return UnionConfig(
      unionName: unionName,
      unionType: UnionType.classUnion,
      unionCases: unionCases,
      utilities: utilities,
    );
  }
}

extension on String {
  String decapitalize() {
    if (isEmpty) return '';
    return this[0].toLowerCase() + substring(1);
  }
}
