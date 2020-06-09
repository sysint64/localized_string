import 'package:flutter_test/flutter_test.dart';

import 'package:localized_string/localized_string.dart';

void main() {
  test('test doc snippet 1', () async {
    LocalizedString.fromFactory((context) => '');

    final s1 = LocalizedString.fromFactory((context) => '--', "title");
    final s2 = LocalizedString.fromFactory((context) => 'asdf', "title");
    final s3 = LocalizedString.fromFactory((context) => 'asdf', "desc");

    assert(s1 == s2);
    assert(s1 != s3);
  });

  test('test doc snippet 2', () async {
    final s1 = LocalizedString.fromString("Hello");
    final s2 = LocalizedString.fromString("world");
    final s = s1 + ' ' + s2;

    assert(s.localize(null) == 'Hello world');
  });

  test('compare localized strings fromString - equals', () async {
    expect(
      LocalizedString.fromString('Test') == LocalizedString.fromString('Test'),
      true,
    );
  });

  test('compare localized strings fromString - not equals', () async {
    expect(
      LocalizedString.fromString('Test') !=
          LocalizedString.fromString('Test 2'),
      true,
    );
  });

  test('compare localized strings with keys - equals', () async {
    expect(
      LocalizedString.fromFactory((_) => 'Test', 'test') ==
          LocalizedString.fromFactory((_) => 'Test', 'test'),
      true,
    );
  });

  test('compare localized strings with keys - not equals', () async {
    expect(
      LocalizedString.fromFactory((_) => 'Test', 'test') !=
          LocalizedString.fromFactory((_) => 'Test', 'test2'),
      true,
    );
  });

  test('compare localized strings without keys - not equals', () async {
    expect(
      LocalizedString.fromFactory((_) => 'Test') !=
          LocalizedString.fromFactory((_) => 'Test'),
      true,
    );
  });

  test('compare localized strings without keys - equals', () async {
    final str = LocalizedString.fromFactory((_) => 'Test');
    expect(str == str, true);
  });

  test('localized factory string', () async {
    final str = LocalizedString.fromFactory((_) => 'Test');
    expect(str.localize(null), 'Test');
  });

  test('localized concat string', () async {
    final hello = LocalizedString.fromFactory((_) => 'Hello');
    final space = LocalizedString.fromFactory((_) => ' ');
    final world = LocalizedString.fromFactory((_) => 'World!');

    final concat = hello + space + world;

    expect(concat.localize(null), 'Hello World!');
  });

  test('localized concat string - join', () async {
    final hello = LocalizedString.fromFactory((_) => 'Hello');
    final world = LocalizedString.fromFactory((_) => 'World!');

    final concat = [hello, world].joinLocalizedS(' ');

    expect(concat.localize(null), 'Hello World!');
  });
}
