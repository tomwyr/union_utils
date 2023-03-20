# Union Utils

A package that allows to easily generate utils code for union types. The generator creates utilities for existing class hierarchies without introducing additional types to the existing code.

## Quick start

Add package dependencies to your project:

```Yaml
dependencies:
  union:
    git:
      url: https://github.com/tomwyr/union_utils.git
      path: union
      ref: v2.0.0

dev_dependencies:
  build_runner:
  union_generator:
    git:
      url: https://github.com/tomwyr/union_utils.git
      path: union_generator
      ref: v2.0.0
```

Get the dependencies:

```
flutter pub get
```

Use any of the available `Union` annotations:

```Dart
@Union.of({
  Cat,
  Dog,
})
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
@Union.of({
  Cat,
  Dog,
})
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

## Annotating external types

If the union annotation cannot be put on the union type directly, e.g. when the types are declared in different packages, create an extension on the type and annotate the extension instead:

```Dart
@Union.of({
  Cat,
  Dog,
})
extension on Animal {}
```

## Utilties

### **map**

A method that transforms union object to a different type by running one of the provided functions based on the actual type of the union.

### **maybeMap**

A method similar to [**map**](#map) that allows providing only selected functions. If no function was provided for the union case, the result of `orElse` function will be returned instead.
