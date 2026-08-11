import 'app_strings.dart';

/// A string that resolves to the current UI language.
/// Reused by all data models so every section translates (not just the hero).
class LocalizedString {
  final String en;
  final String ar;
  final String de;

  const LocalizedString({required this.en, required this.ar, this.de = ''});

  /// Returns the localized value for the active language.
  String get value => AppStrings.get(en, ar, de.isEmpty ? en : de);

  @override
  String toString() => value;
}
