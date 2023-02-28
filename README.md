# Union

A package that allows to easily generate utils code for union types. The generator creates utilities for existing class hierarchies without introducing additional types to the existing code.

## Usage

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

### **Enums**
Annotate an existing enum to add union capabilities to it to be able to operate on the enum like on a regular class:
```Dart
@EnumUnion()
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
