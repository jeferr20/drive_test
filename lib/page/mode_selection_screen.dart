import 'package:drive_test/components/widget_licencias.dart';
import 'package:drive_test/page/pregunta_screen.dart';
import 'package:drive_test/page/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeleccionModo extends StatelessWidget {
  const SeleccionModo({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriaSelect = Get.arguments;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          categoriaSelect.value,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 25),
            WidgetModo(
              titulo: "Practica",
              imagenURL: 'assets/practice.png',
              onPressed: () {
                categoriaSelect.value = categoriaSelect.value;
                Get.to(() => const ExamenScreen(), arguments: categoriaSelect);
              },
            ),
            const SizedBox(height: 25),
            WidgetModo(
              titulo: "Estudia",
              imagenURL: 'assets/study.png',
              onPressed: () {
                categoriaSelect.value = categoriaSelect.value;
                Get.to(() => PreguntaScreen(), arguments: categoriaSelect);
              },
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
