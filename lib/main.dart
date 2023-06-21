import 'package:drive_test/controllers/auth_controller.dart';
import 'package:drive_test/page/splash_screen.dart';
import 'package:drive_test/theme/dark_theme.dart';
import 'package:drive_test/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(GetMaterialApp(
    theme: lighTheme,
    darkTheme: darkTheme,
    debugShowCheckedModeBanner: false,
    home: const SplashScreen(),
  ));
}
