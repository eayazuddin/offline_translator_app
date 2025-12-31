import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_strings.dart';
import '../../../widget/custom_dropdown_field.dart';
import '../controller/onboard_controller.dart';
import 'home.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => const Home());
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green,
                ),
                child: Center(child: Text(AppStrings.goToNextPage.tr)),
              ),
            ),
            const SizedBox(height: 10),
            CustomDropdownField<String>(
              hintText: "Select Language",
              items: const ["Bangla", "English", "Spanish", "Arabic"],
              onChanged: (value) {
                if (value == null) return;
                switch (value) {
                  case "Bangla":
                    controller.changeIndex(0, const Locale('bn', 'BD'));
                    break;
                  case "English":
                    controller.changeIndex(1, const Locale('en', 'US'));
                    break;
                  case "Spanish":
                    controller.changeIndex(2, const Locale('es', 'ES'));
                    break;
                  case "Arabic":
                    controller.changeIndex(3, const Locale('ar', 'SA'));
                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
