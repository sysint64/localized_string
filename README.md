# localized_string

LocalizedString is an implementation of String that depends on BuildContext.

It can be helpful if you need to return a string which should be localized in the future but you don't
have a context. Simple example is validator, it should return localized string but it can't use the context
because validator is encapsulated from it. 

## Examples

To create localized string use this snippet: 

```dart
LocalizedString.fromFactory((context) => AppLoc.of(context).title);
```

To compare localized string you should specify key for each of them:

```dart
final s1 = LocalizedString.fromFactory((context) => AppLoc.of(context).title, 'title');
final s2 = LocalizedString.fromFactory((context) => AppLoc.of(context).title, 'title');
final s3 = LocalizedString.fromFactory((context) => AppLoc.of(context).desc, 'desc');

assert(s1 == s2);
assert(s1 != s3);
```

Also you can create LocalizedString from regular string:

```dart
LocalizedString.fromString("Hello world");
```

it will create LocalizedString with the same key as its value.

To localize string, just call `localize` method:

```dart
final s1 = LocalizedString((context) => AppLoc.of(context).title, 'title');
s1.localize(context);
```

You can concatenate two strings by using + operator:

```dart
final s1 = LocalizedString.fromString("Hello");
final s2 = LocalizedString.fromString("world");
final s = s1 + ' ' + s2;

assert(s.localize(context) == 'Hello world');
```

And join:

```dart
final hello = LocalizedString.fromFactory((_) => 'Hello');
final world = LocalizedString.fromFactory((_) => 'World!');

final concat = [hello, world].joinLocalizedS(' ');
// or
final concat = [hello, world].joinLocalized(LocalizedString.fromString(' '));

assert(concat.localize(context) == 'Hello World!');
```
