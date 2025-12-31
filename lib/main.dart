import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:language_translate_app/share/controller/language_controller.dart';
import 'package:language_translate_app/utils/app_const.dart';
import 'package:language_translate_app/view/home/controller/onboard_controller.dart';
import 'package:language_translate_app/view/home/view/onboard.dart';

void main() async {
  Get.put(LanguageController());
  Get.put(HomeController());
  WidgetsFlutterBinding.ensureInitialized();

  // Localization
  Map<String, Map<String, String>>? languages =
      await LanguageController.getLanguages();

  runApp(MyApp(languages: languages));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.languages});

  final Map<String, Map<String, String>>? languages;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      init: LanguageController(),
      builder: (localizeController) {
        if (kDebugMode) {
          print(localizeController.locale.countryCode);
          print(localizeController.locale.languageCode);
        }
        return GetMaterialApp(
          title: 'Translator app',
          debugShowCheckedModeBanner: false,
          locale: localizeController.locale,
          translations: Messages(languages: languages),
          fallbackLocale: Locale(
            AppConstants.languages.first.languageCode,
            AppConstants.languages.first.countryCode,
          ),
          home: const LanguageDropdown(),
        );
      },
    );
  }
}
