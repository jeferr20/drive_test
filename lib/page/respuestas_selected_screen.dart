import 'package:drive_test/components/button.dart';
import 'package:drive_test/components/opciones.dart';
import 'package:drive_test/controllers/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class RespuestasSelectedScreen extends StatelessWidget {
  final QuizzController quizzController = Get.find();
  final quizId = Get.arguments;

  RespuestasSelectedScreen({super.key}) {
    quizzController.setIndiceInicial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Preguntas del Simulacro',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back(result: quizId);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Obx(() {
        final List<Map<String, dynamic>> preguntasQuizz =
            quizzController.preguntasQuizz;
        final int indiceActual = quizzController.indiceActual;
        if (preguntasQuizz.isEmpty) {
          return const Center(
            child: Text(
              'No hay preguntas disponibles',
              style: TextStyle(fontSize: 18),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(
              '${indiceActual + 1}. ${preguntasQuizz[indiceActual]['enunciado']}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            if (preguntasQuizz[indiceActual]['imagenUrl']?.isNotEmpty == true)
              Image.network(
                preguntasQuizz[indiceActual]['imagenUrl'],
                fit: BoxFit.fill,
                height: 120,
              ),
            Expanded(
              child: ListView.builder(
                itemCount: preguntasQuizz[indiceActual]['opciones'].length,
                itemBuilder: (context, index) {
                  final opcion =
                      preguntasQuizz[indiceActual]['opciones'][index];
                  final esRespuestaCorrecta = index ==
                      preguntasQuizz[indiceActual]['respuestaCorrecta'];
                  final esRespuestaIncorrecta = index ==
                      preguntasQuizz[indiceActual]['respuestaSeleccionada'];
                  Color colorFondo;
                  Color colorLetra;
                  if (esRespuestaCorrecta) {
                    colorFondo = HexColor("#00e272");
                    colorLetra = Colors.white;
                  } else if (esRespuestaIncorrecta && !esRespuestaCorrecta) {
                    colorFondo = HexColor("#fa4b42");
                    colorLetra = Colors.white;
                  } else {
                    colorFondo = const Color.fromARGB(255, 197, 197, 197);
                    colorLetra = Colors.black;
                  }
                  return ListTile(
                    title: OpcionesPreguntas(
                      color: colorFondo,
                      texto: opcion,
                      colorLetra: colorLetra,
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (indiceActual > 0)
                  MyButtonExam(
                    onPressed: () => quizzController.retrocederPregunta(),
                    buttonText: "Anterior",
                  ),
                if (indiceActual < preguntasQuizz.length - 1)
                  MyButtonExam(
                    onPressed: () => quizzController.avanzarPregunta(),
                    buttonText: "Siguiente",
                  ),
                if (quizzController.indiceActual ==
                    quizzController.preguntasQuizz.length - 1)
                  MyButtonExam(
                    onPressed: () {
                      quizzController.resetearQuizz();
                      Get.until((route) => route.isFirst);
                    },
                    buttonText: "Ir a Inicio",
                  ),
              ],
            ),
          ]),
        );
      }),
    );
  }
}
