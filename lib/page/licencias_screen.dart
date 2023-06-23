import 'package:drive_test/page/mode_selection_screen.dart';
import 'package:get/get.dart';
import 'package:drive_test/components/widget_licencias.dart';
import 'package:flutter/material.dart';

class LicenciasScreen extends StatelessWidget {
  const LicenciasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxString categoriaSelect = ''.obs;
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Categoría A",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                WidgetModernCategory(
                    onPressed: () {
                      categoriaSelect.value = "Categoría A-I";
                      Get.to(() => const SeleccionModo(),
                          arguments: categoriaSelect);
                    },
                    titulo: "Categoría A-I",
                    vehiculos: "Vehículos de la categoría M1, M2 y N1",
                    imagenURL: 'assets/A1.png'),
                const SizedBox(height: 15),
                WidgetModernCategory(
                    onPressed: () {
                      categoriaSelect.value = "Categoría A-II-A";
                      Get.to(() => const SeleccionModo(),
                          arguments: categoriaSelect);
                    },
                    titulo: "Categoría A-II-A",
                    vehiculos: "Vehículos M1 - Servicio de transporte",
                    imagenURL: 'assets/A2A.png'),
                const SizedBox(height: 15),
                WidgetModernCategory(
                    onPressed: () {
                      categoriaSelect.value = "Categoría A-II-B";
                      Get.to(() => const SeleccionModo(),
                          arguments: categoriaSelect);
                    },
                    titulo: "Categoría A-II-B",
                    vehiculos: "Vehículos de la categoría M2, M3 y N2",
                    imagenURL: 'assets/A2B.png'),
                const SizedBox(height: 15),
                WidgetModernCategory(
                    onPressed: () {
                      categoriaSelect.value = "Categoría A-III-A";
                      Get.to(() => const SeleccionModo(),
                          arguments: categoriaSelect);
                    },
                    titulo: "Categoría A-III-A",
                    vehiculos: "Vehículos de la categoría M3 > 6T",
                    imagenURL: 'assets/A3A.png'),
                const SizedBox(height: 15),
                WidgetModernCategory(
                    onPressed: () {
                      categoriaSelect.value = "Categoría A-III-B";
                      Get.to(() => const SeleccionModo(),
                          arguments: categoriaSelect);
                    },
                    titulo: "Categoría A-III-B",
                    vehiculos: "Vehículos de la categoría N3",
                    imagenURL: 'assets/A3B.png'),
                const SizedBox(height: 15),
                WidgetModernCategory(
                    onPressed: () {
                      categoriaSelect.value = "Categoría A-III-C";
                      Get.to(() => const SeleccionModo(),
                          arguments: categoriaSelect);
                    },
                    titulo: "Categoría A-III-C",
                    vehiculos: "Vehículos de la categoría M3 y N3",
                    imagenURL: 'assets/A3C.png'),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text("Categoría B",
                        style: Theme.of(context).textTheme.headlineLarge),
                  ],
                ),
                const SizedBox(height: 5),
                WidgetModernCategory(
                    onPressed: () {
                      categoriaSelect.value = "Categoría B-II-A";
                      Get.to(() => const SeleccionModo(),
                          arguments: categoriaSelect);
                    },
                    titulo: "Categoría B-II-A",
                    vehiculos: "Vehículos de la categoría L1, L2",
                    imagenURL: 'assets/B2A.png'),
                const SizedBox(height: 15),
                WidgetModernCategory(
                    onPressed: () {
                      categoriaSelect.value = "Categoría B-II-B";
                      Get.to(() => const SeleccionModo(),
                          arguments: categoriaSelect);
                    },
                    titulo: "Categoría B-II-B",
                    vehiculos: "Vehículos de la categoría L3, L4",
                    imagenURL: 'assets/B2B.png'),
                const SizedBox(height: 15),
                WidgetModernCategory(
                    onPressed: () {
                      categoriaSelect.value = "Categoría B-II-C";
                      Get.to(() => const SeleccionModo(),
                          arguments: categoriaSelect);
                    },
                    titulo: "Categoría B-II-C",
                    vehiculos: "Vehículos de la categoría L5",
                    imagenURL: 'assets/B2C.png'),
                const SizedBox(height: 15),
              ],
              //mainAxisAlignment: MainAxisAlignment.center,
            ),
          )),
    );
  }
}
