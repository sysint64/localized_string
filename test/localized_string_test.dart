import 'package:flutter_test/flutter_test.dart';

import 'package:localized_string/localized_string.dart';

void main() {
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
      LocalizedString((_) => 'Test', 'test') ==
          LocalizedString((_) => 'Test', 'test'),
      true,
    );
  });

  test('compare localized strings with keys - not equals', () async {
    expect(
      LocalizedString((_) => 'Test', 'test') !=
          LocalizedString((_) => 'Test', 'test2'),
      true,
    );
  });

  test('compare localized strings without keys - not equals', () async {
    expect(
      LocalizedString((_) => 'Test') != LocalizedString((_) => 'Test'),
      true,
    );
  });

  test('compare localized strings without keys - equals', () async {
    final str = LocalizedString((_) => 'Test');
    expect(str == str, true);
  });
}
