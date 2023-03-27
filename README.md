# Union Utils

A package that allows to easily generate utils code for union types. The generator creates utilities for existing class hierarchies without introducing additional types to the existing code.

## Quick start

Add package dependencies to your project:

```Yaml
dependencies:
  union_annotation: ^2.5.2

dev_dependencies:
  build_runner:
  union_generator: ^2.5.2
```

Get the dependencies:

```
flutter pub get
```

Use any of the available `Union` annotations:

```Dart
@Union.of(
  types: {
    Cat,
    Dog,
  },
)
abstract class Animal {}
```

Generate code for the annotation:

```
flutter pub run build_runner build
```

Use the utilities generated for the union type:

```Dart
void fun(Animal animal) {
  animal.map(
    cat: (cat) {},
    dog: (dog) {},
  );
}
```

## Annotations

### **Classes**

Annotate an existing class that you want to make a union type and declare all types that should be considered the union cases:

```Dart
@Union.of(
  types: {
    Cat,
    Dog,
  },
)
abstract class Animal {}

class Cat implements Animal {}

class Dog extends Animal {}
```

The annotation on a class will generate an extension on `Animal` class with utility methods:

```Dart
animal.map(
  cat: (cat) {
    // It's a cat.
  },
  dog: (dog) {
    // Definitely a dog.
  },
);
```

If all union subtypes and the union itself are declared in the same file, the `types` parameter can be omitted (assuming all subtypes are considered types of the union):

```Dart
@Union.of()
abstract class Animal {}

class Cat implements Animal {}

class Dog extends Animal {}
```

Alternatively, use the extended version of the annotation that allows for additional customization of the resulting code:

```Dart
@Union.ofCases({
  TypeCase(type: Cat, name: 'Cate'),
  TypeCase(type: Dog, name: 'Doge'),
})
abstract class Animal {}
```

### **Enums**

Annotate an existing enum to add union capabilities to it to be able to operate on the enum like on a regular class:

```Dart
@Union.ofEnum()
enum Animal {
  cat,
  dog,
}
```

The annotation on an enum will generate an extension on `Animal` enum with similar utility methods:

```Dart
animal.map(
  cat: () {
    // It's a cat.
  },
  dog: () {
    // Definitely a dog.
  },
);
```

Alternatively, use the extended version of the annotation that allows for additional customization of the resulting code:

```Dart
@Union.ofEnumCases({
  EnumCase(value: Animal.cat, name: 'cate'),
  EnumCase(value: Animal.dog, name: 'doge'),
})
enum Animal {
  cat,
  dog,
}
```

### **Common**

There are configuration options that can be defined on any of the union types:

- **paramsType** - defines the type of parameters used by the generated utilities for annotated unions (defaults to `UnionParamsType.named`):

  ```Dart
  @Union.of(
    types: {
      Cat,
      Dog,
    },
    paramsType: UnionParamsType.positional,
  )
  abstract class Animal {}
  ```

  The annotation will generate all union utilities with positional parameters:

  ```Dart
  animal.map(
    (cat) {
      // It's a cat.
    },
    (dog) {
      // Definitely a dog.
    },
  );
  ```

- **utilities** - defines which utilities should be generated for the annotated union (defaults to `UnionUtilities.all`):
  ```Dart
  @Union.of(
    types: {
      Cat,
      Dog,
    },
    utilities: UnionUtilities.only(
      map: true,
      asType: true,
    ),
  )
  abstract class Animal {}
  ```
  The annotation will generate only a `map` method and `as*Type*` getters.

## Annotating external types

If the union annotation cannot be put on the union type directly, e.g. when the types are declared in different packages, create an extension on the type and annotate the extension instead:

```Dart
@Union.of(
  types: {
    Cat,
    Dog,
  },
)
extension on Animal {}
```

## Utilties

### **map**

A method that transforms union object to a different type by running one of the provided functions based on the actual type of the union.

### **mapOrNull**

A method similar to [**map**](#map) that allows providing only selected functions. If no function was provided for the union case, a `null` values will be returned instead.

### **maybeMap**

A method similar to [**map**](#map) that allows providing only selected functions. If no function was provided for the union case, the result of `orElse` function will be returned instead.

### **as\*Type\***

A method that casts union object to a specific type. If the actual type is different than the requested one, a runtime error will be thrown instead.

### **as\*Type\*OrNull**

A method similar to [**as\*Type\***](#asType) that returns a `null` value, if the actual union type is different than the requested one.

## Build options

Default values used by the generator can be modified through the `build.yaml` file. The available options which can be configured are listed below:

```Yaml
options:
  # Modifies UnionParamsType
  params_type:
  # Modifies UnionUtilities
  utilities:
    map:
    map_or_null:
    maybe_map:
    as_type:
    as_type_or_null:
```

An example `build.yaml` configuration for the package:

```Yaml
targets:
  $default:
    builders:
      union_generator:
        options:
          params_type: positional
          utilities:
            map: false
            map_or_null: true
            maybe_map: false
            as_type: true
            as_type_or_null: false
```
