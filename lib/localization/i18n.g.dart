// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'i18n.dart';

// **************************************************************************
// RosettaStoneGenerator
// **************************************************************************

/// A factory for a set of localized resources of type I18n, to be loaded by a
/// [Localizations] widget.
class _$I18nDelegate extends LocalizationsDelegate<I18n> {
  /// Whether the the given [locale.languageCode] code has a JSON associated with it.
  @override
  bool isSupported(Locale locale) =>
      const ['zh', 'en'].contains(locale.languageCode);

  /// Returns true if the resources for this delegate should be loaded
  /// again by calling the [load] method.
  @override
  bool shouldReload(LocalizationsDelegate<I18n> old) => false;

  /// Loads the JSON associated with the given [locale] using [Strings].
  @override
  Future<I18n> load(Locale locale) async {
    var i18n = I18n();
    await i18n.load(locale);
    return i18n;
  }
}

/// Contains the keys read from the JSON
class _$Keys {
  static final String test = 'test';
}

/// Loads and allows access to string resources provided by the JSON
/// for the specified [Locale].
///
/// Should be used as an abstract or mixin class for [I18n].
abstract class _$I18nHelper {
  Map<String, String> _translations;

  /// Loads and decodes the JSON associated with the given [locale].
  Future<void> load(Locale locale) async {
    var jsonStr =
        await rootBundle.loadString('i18n/${locale.languageCode}.json');
    Map jsonMap = json.decode(jsonStr);
    _translations = jsonMap
        .map<String, String>((key, value) => MapEntry(key, value as String));
  }

  /// Returns the requested string resource associated with the given [key].
  String _translate(String key) => _translations[key];

  /// Simple getter methods
  String get test => _translate(_$Keys.test);
}
