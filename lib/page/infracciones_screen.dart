import 'package:drive_test/components/infracciones.dart';
import 'package:drive_test/controllers/infracciones_controller.dart';
import 'package:drive_test/functions/infracciones_func.dart';
import 'package:drive_test/models/infracciones.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchable_listview/searchable_listview.dart';

class InfraccionesScreen extends StatelessWidget {
  final InfraccionesController infraccionesController =
      Get.put(InfraccionesController());
  InfraccionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      minimum: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Obx(() {
        if (infraccionesController.infracciones.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SearchableList(
            autoFocusOnSearch: false,
            initialList: infraccionesController.infracciones,
            builder: (Infracciones infracciones) {
              Color colorCodigo = getColorCodigo(infracciones.codigo);
              return InfraccionDetails(
                colorCodigo: colorCodigo,
                infracciones: infracciones,
              );
            },
            filter: (value) => infraccionesController.infracciones
                .where(
                  (element) => element.codigo.toLowerCase().contains(value),
                )
                .toList(),
            emptyWidget: const EmptyView(),
            inputDecoration: InputDecoration(
                labelText: "Buscar código de infracción",
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                hoverColor: Theme.of(context).colorScheme.secondary,
                fillColor: Theme.of(context).colorScheme.secondary,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                isCollapsed: true,
                contentPadding: const EdgeInsets.all(15)),
          );
        }
      }),
    ));
  }
}
