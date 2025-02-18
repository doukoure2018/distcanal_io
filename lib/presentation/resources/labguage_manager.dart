// ignore_for_file: constant_identifier_names

enum LanguageType { ENGLISH, ARABIC, FRENCH }

const String ARABIC = "ar";
const String ENGLISH = "en";
const String FRENCH = "fr";

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
      case LanguageType.FRENCH:
        return FRENCH;
    }
  }
}
