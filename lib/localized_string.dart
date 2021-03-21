library localized_string;

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

abstract class LocalizedString extends Equatable {
  static LocalizedString fromString(String string) => FactoryLocalizedString((_) => string, string);

  static LocalizedString empty() => FactoryLocalizedString((_) => '', '');

  static LocalizedString fromFactory(
    String Function(BuildContext) factory, [
    String? key,
  ]) =>
      FactoryLocalizedString(factory, key ?? Uuid().v4());

  LocalizedString operator +(Object other) {
    if (other is LocalizedString) {
      return ConcatLocalizedString(this, other);
    } else if (other is String) {
      return ConcatLocalizedString(this, LocalizedString.fromString(other));
    } else {
      throw UnsupportedError('Unknown type for $other');
    }
  }

  String localize(BuildContext context);
}

class FactoryLocalizedString extends LocalizedString {
  final String Function(BuildContext) _localize;
  final String key;

  FactoryLocalizedString(this._localize, this.key);

  @override
  String localize(BuildContext context) {
    return _localize(context);
  }

  @override
  List<Object> get props => [key];
}

class ConcatLocalizedString extends LocalizedString {
  final LocalizedString lhs;
  final LocalizedString rhs;

  ConcatLocalizedString(this.lhs, this.rhs);

  @override
  String localize(BuildContext context) {
    return lhs.localize(context) + rhs.localize(context);
  }

  @override
  List<Object> get props => [lhs, rhs];
}

extension JoinLocalize on List<LocalizedString> {
  LocalizedString joinLocalizedS(String separator) {
    return joinLocalized(LocalizedString.fromString(separator));
  }

  LocalizedString joinLocalized(LocalizedString separator) {
    var result = LocalizedString.fromString('');

    for (var i = 0; i < length; i++) {
      final component = this[i];
      result += component;

      if (i < length - 1) {
        result += separator;
      }
    }

    return result;
  }
}
