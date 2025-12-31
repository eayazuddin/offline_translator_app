import '../share/model/language_model.dart';

class AppConstants {
  static const String languageCode = "languagesCode";
  static const String countryCode = "countryCode";
  static const String selectedValue = "selectedValue";

  static List<LanguageModel> languages = [
    LanguageModel(
      imageUrl: "",
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
    LanguageModel(
      imageUrl: "",
      languageName: 'Spanish',
      countryCode: 'ES',
      languageCode: 'es',
    ),
    LanguageModel(
      imageUrl: "",
      languageName: 'Bangle',
      countryCode: 'BD',
      languageCode: 'bn',
    ),
    LanguageModel(
      imageUrl: "",
      languageName: 'Arabic',
      countryCode: 'Ar',
      languageCode: 'ar',
    ),
  ];
}
