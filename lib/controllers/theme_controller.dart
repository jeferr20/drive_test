import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var themeMode = ThemeMode.system.obs;

  void changeTheme(ThemeMode newThemeMode) {
    themeMode.value = newThemeMode;
    Get.changeThemeMode(newThemeMode);
  }
}
