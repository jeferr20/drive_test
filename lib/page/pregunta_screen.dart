import 'package:drive_test/components/button.dart';
import 'package:drive_test/components/opciones.dart';
import 'package:drive_test/controllers/preguntas_controller.dart';
import 'package:drive_test/models/pregunta_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class PreguntaScreen extends StatelessWidget {
  final PreguntasController preguntaController = Get.find();
  PreguntaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriaSelect = Get.arguments;
    String materiaSelect = 'Materias Generales';
    preguntaController.cargarPreguntas('preguntas_A1');
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
        actions: [
          if (categoriaSelect.value != 'Categoría A-I')
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'mateGene') {
                  materiaSelect = 'Materias Generales';
                  preguntaController.cargarPreguntas('preguntas_A1');
                } else if (value == 'mateEspe') {
                  materiaSelect = 'Materias Especificas';
                  preguntaController.cargarPreguntas(categoriaSelect.value);
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'mateGene',
                  child: Text('Materias Generales'),
                ),
                const PopupMenuItem<String>(
                  value: 'mateEspe',
                  child: Text('Materias Especificas'),
                ),
              ],
              icon: const Icon(Icons.book_outlined),
            )
        ],
      ),
      body: Obx(
        () {
          final Pregunta pregunta =
              preguntaController.preguntas[preguntaController.indiceActual];
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      materiaSelect,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
                Text(
                  '${preguntaController.indiceActual + 1}. ${pregunta.enunciado}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                // if (pregunta.imagenUrl?.isNotEmpty == true)
                //   Image.network(
                //     pregunta.imagenUrl!,
                //     fit: BoxFit.fill,
                //     height: 120,
                //   ),
                Expanded(
                  child: ListView.builder(
                    itemCount: pregunta.opciones.length,
                    itemBuilder: (context, index) {
                      final opcion = pregunta.opciones[index];
                      final esRespuestaCorrecta =
                          index == pregunta.respuestaCorrecta;
                      final colorFondo = esRespuestaCorrecta
                          ? HexColor("#00e272")
                          : HexColor('##c5c5c5');
                      final colorLetra =
                          esRespuestaCorrecta ? Colors.white : Colors.black;
                      return ListTile(
                          title: OpcionesPreguntas(
                        color: colorFondo,
                        texto: opcion,
                        colorLetra: colorLetra,
                      ));
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (preguntaController.indiceActual > 0)
                      MyButtonExam(
                          onPressed: () =>
                              preguntaController.retrocederPregunta(),
                          buttonText: "Anterior"),
                    if (preguntaController.indiceActual <
                        preguntaController.preguntas.length - 1)
                      MyButtonExam(
                          onPressed: () => preguntaController.avanzarPregunta(),
                          buttonText: "Siguiente"),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
