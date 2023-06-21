import 'package:drive_test/controllers/preguntas_controller.dart';
import 'package:drive_test/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PreguntasController());
    Get.put(QuizzController());
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: HexColor("#143d59"),
        child: Image.asset('assets/logoDriveTest.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.25));
  }
}
