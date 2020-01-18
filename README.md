# localized_string

LocalizedString is an implementation of String that depends on BuildContext.

It can be helpful if you need to return a string which should be localized in the future but you don't
have a context. Simple example is validator, it should return localized string but it can't use the context
because validator is encapsulated from it. 

## Examples

To create localized string use this snippet: 

```dart
LocalizedString((context) => AppLoc.of(context).title);
```

To compare localized string you should specify key for each of them:

```dart
s1 = LocalizedString((context) => AppLoc.of(context).title, "title");
s2 = LocalizedString((context) => AppLoc.of(context).title, "title");
s3 = LocalizedString((context) => AppLoc.of(context).desc, "desc");

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
s1 = LocalizedString((context) => AppLoc.of(context).title, "title");
s1.localize(context);
```
