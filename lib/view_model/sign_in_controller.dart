import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignInController extends GetxController {
  final box = GetStorage();
  RxBool isSwitchOn = false.obs;

  @override
  void onInit() {
    // Read the stored language value and update the switch state
    bool? savedLanguage = box.read("language");
    if (savedLanguage != null) {
      isSwitchOn.value = savedLanguage;
    }
    super.onInit();
  }

  // Function to change the switch and update the locale
  void changeSwitchButton(bool value) {
    isSwitchOn.value = value;
    if (value == true) {
      // If switch is turned on, set language to Bangla
      Get.updateLocale(const Locale("bn", "BD"));
      box.write("language", true);
    } else {
      // If switch is turned off, set language to English
      Get.updateLocale(const Locale("en", "US"));
      box.write("language", false);
    }
  }
}
