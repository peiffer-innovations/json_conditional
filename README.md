# json_conditional

Library that provides a `Conditional` class that can be used to perform dynamic evaluations.  The `Conditional` class can be constructed directly, or the `Conditional.fromDynamic` static function can be used to build one from a Map-like object (such as what results form `json.decode(...)`).

## Using the library

Add the repo to your Flutter `pubspec.yaml` file.

```
dependencies:
  json_conditional: <<version>> 
```

Then run...
```
flutter packages get
```


## Example

```dart
import 'dart:convert';
import 'package:json_conditional/json_conditional';

// ...

var conditional = Conditional.fromDynamic(json.decode(someJsonString));
var values = json.decode(someOtherJsonString);

if (conditional.evaluate(values)) {
  // do something
} else {
  // do something else
}

```