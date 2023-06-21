import 'dart:async';
import 'package:drive_test/components/button.dart';
import 'package:drive_test/components/opciones.dart';
import 'package:drive_test/controllers/quiz_controller.dart';
import 'package:drive_test/functions/resultados_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ExamenScreen extends StatefulWidget {
  const ExamenScreen({super.key});

  @override
  State<ExamenScreen> createState() => _ExamenScreenState();
}

class _ExamenScreenState extends State<ExamenScreen> {
  late int respuestaSeleccionada;
  final categoriaSelect = Get.arguments;
  final quizzController = Get.put(QuizzController());
  final int tiempoTotal = 40; // Tiempo total en segundos
  int tiempoTranscurrido = 0;
  late Timer _timer;
  Color progressColor = Colors.blue;
  double progreso =
      1.0; // Valor de la barra de progreso (inicialmente completa)

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    int tiempoRestante = tiempoTotal;
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (tiempoRestante > 0) {
          tiempoRestante--;
          progreso = (tiempoTotal - tiempoRestante).toDouble();
          tiempoTranscurrido++;
          if (tiempoRestante == 30) {
            progressColor = Colors.yellow;
          }
          if (tiempoRestante == 5) {
            progressColor = Colors.red;
          }
        } else {
          timer.cancel();
          // Aquí puedes llamar a la función para calcular los resultados
          calcularResultados(
              quizzController.preguntasQuizz, tiempoTranscurrido);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          categoriaSelect.value,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Obx(
        () {
          //Color progColor;
          final Map<String, dynamic> pregunta =
              quizzController.preguntasQuizz[quizzController.indiceActual];
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LinearPercentIndicator(
                      percent: progreso / tiempoTotal,
                      lineHeight: 35.0,
                      width: MediaQuery.of(context).size.width - 70,
                      backgroundColor: HexColor("#d9d9d9"),
                      progressColor: progressColor,
                      barRadius: const Radius.circular(20),
                      center: Text(
                        '${quizzController.indiceActual + 1}/${quizzController.preguntasQuizz.length}',
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  '${quizzController.indiceActual + 1}. ${pregunta['enunciado']}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                if (pregunta['imagenUrl'] != null &&
                    pregunta['imagenUrl'].isNotEmpty)
                  Image.network(
                    pregunta['imagenUrl'],
                    fit: BoxFit.fill,
                    height: 120,
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: pregunta['opciones'].length,
                    itemBuilder: (context, index) {
                      final opcion = pregunta['opciones'][index];
                      final esRespuestaSeleccionada =
                          pregunta['respuestaSeleccionada'] == index;
                      final colorFondo = esRespuestaSeleccionada
                          ? Colors.blue
                          : HexColor('#d9d9d9');
                      final colorLetra =
                          esRespuestaSeleccionada ? Colors.white : Colors.black;
                      return ListTile(
                        title: OpcionesPreguntas(
                          color: colorFondo,
                          texto: opcion,
                          colorLetra: colorLetra,
                          ontap: () {
                            quizzController.preguntasQuizz[quizzController
                                .indiceActual]['respuestaSeleccionada'] = index;
                            setState(() {
                              respuestaSeleccionada = index;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (quizzController.indiceActual > 0)
                      MyButtonExam(
                        onPressed: () => quizzController.retrocederPregunta(),
                        buttonText: "Anterior",
                      ),
                    if (quizzController.indiceActual <
                        quizzController.preguntasQuizz.length - 1)
                      MyButtonExam(
                        onPressed: () => quizzController.avanzarPregunta(),
                        buttonText: "Siguiente",
                      ),
                    if (quizzController.indiceActual ==
                        quizzController.preguntasQuizz.length - 1)
                      MyButtonExam(
                        onPressed: () {
                          calcularResultados(quizzController.preguntasQuizz,
                              tiempoTranscurrido);
                        },
                        buttonText: "Finalizar",
                      ),
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
