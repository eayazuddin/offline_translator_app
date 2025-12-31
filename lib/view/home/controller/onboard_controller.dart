import 'dart:ui';
import 'package:get/get.dart';
import '../../../share/controller/language_controller.dart';

class HomeController extends GetxController{
  void changeIndex(int index, Locale local) {
    final localController = Get.find<LanguageController>();
    localController.setLanguage(local, index);
  }
}

