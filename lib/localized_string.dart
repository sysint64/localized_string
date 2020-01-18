library localized_string;

import 'package:flutter/widgets.dart';

class LocalizedString {
  final String Function(BuildContext) localize;
  final String key;

  LocalizedString(this.localize, [this.key]);

  static fromString(String string) => LocalizedString((_) => string, string);

  @override
  bool operator ==(Object other) {
    if (key != null) {
      return other is LocalizedString && other.key == key;
    } else {
      return super == other;
    }
  }

  @override
  int get hashCode {
    if (key != null) {
      return key.hashCode;
    } else {
      return super.hashCode;
    }
  }
}
