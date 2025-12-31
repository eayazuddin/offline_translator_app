import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/app_const.dart';
import '../model/language_model.dart';

class LanguageController extends GetxController implements GetxService {
  Locale _locale = Locale(
    AppConstants.languages[0].languageCode,
    AppConstants.languages[0].countryCode,
  );
  List<LanguageModel> _languages = [];

  Locale get locale => _locale;

  List<LanguageModel> get languages => _languages;

  void setLanguage(Locale locale, int selectedValue) {
    Get.updateLocale(locale);
    _locale = locale;
    saveLanguage(_locale, selectedValue);
    setSelectIndex(selectedValue);
    update();
  }

  void loadCurrentLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _locale = Locale(
      sharedPreferences.getString(AppConstants.languageCode) ??
          AppConstants.languages[0].languageCode,
      sharedPreferences.getString(AppConstants.countryCode) ??
          AppConstants.languages[0].countryCode,
    );

    for (int index = 0; index < AppConstants.languages.length; index++) {
      if (AppConstants.languages[index].languageCode == _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }
    _languages = [];
    _languages.addAll(AppConstants.languages);
    Get.updateLocale(_locale);
    update();
  }

  void saveLanguage(Locale locale, int selectedValue) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(AppConstants.languageCode, locale.languageCode);
    sharedPreferences.setString(AppConstants.countryCode, locale.countryCode!);
    sharedPreferences.setInt(AppConstants.selectedValue, selectedValue);
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectIndex(int index) {
    _selectedIndex = index;
    update();
  }

  static Future<Map<String, Map<String, String>>> getLanguages() async {
    Map<String, Map<String, String>> languages = {};
    for (LanguageModel languageModel in AppConstants.languages) {
      String jsonStringValues = await rootBundle.loadString(
        'assets/language/${languageModel.languageCode}.json',
      );
      Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
      Map<String, String> json = {};
      mappedJson.forEach((key, value) {
        json[key] = value.toString();
      });
      languages['${languageModel.languageCode}_${languageModel.countryCode}'] = json;
    }
    return languages;
  }

  @override
  void onInit() {
    super.onInit();
    loadCurrentLanguage();
  }
}

class Messages extends Translations {
  final Map<String, Map<String, String>>? languages;

  Messages({required this.languages});

  @override
  Map<String, Map<String, String>> get keys {
    return languages!;
  }
}
