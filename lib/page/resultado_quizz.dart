import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drive_test/components/button.dart';
import 'package:drive_test/controllers/quiz_controller.dart';
import 'package:drive_test/functions/resultados_func.dart';
import 'package:drive_test/page/respuestas_selected_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pie_chart/pie_chart.dart';

class ResultadoQuizzScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  ResultadoQuizzScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizId = Get.arguments;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Resultado del Simulacro',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _firestore.collection('quizzes').doc(quizId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = snapshot.data?.data() as Map<String, dynamic>?;
          if (data == null) {
            return const Center(
              child: Text('No se encontraron resultados para este Quizz.'),
            );
          }
          final preguntasCorrectas = data['preguntasCorrectas'] as int;
          final totalPreguntas = data['totalPreguntas'] as int;
          final duracionExamen = data['duracionExamen'] as int;
          final categoria = data['categoria'] as String;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Simulacro Examen $categoria',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                const SizedBox(height: 20),
                PieChart(
                  dataMap: {
                    'Correctas': preguntasCorrectas.toDouble(),
                    'Incorrectas':
                        (totalPreguntas - preguntasCorrectas).toDouble(),
                  },
                  colorList: [HexColor("#00e272"), HexColor("#fa4b42")],
                  chartRadius: MediaQuery.of(context).size.width / 2,
                  chartType: ChartType.disc,
                  legendOptions: LegendOptions(
                    showLegendsInRow: true,
                    legendPosition: LegendPosition.bottom,
                    legendTextStyle: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  formatChartValues: (value) {
                    return '${(value / totalPreguntas * 100).toInt()}%';
                  },
                ),
                const SizedBox(height: 15),
                Text(
                  'Respuestas Correctas: ${preguntasCorrectas.toInt()}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Respuestas Incorrectas: ${(totalPreguntas - preguntasCorrectas).toInt()}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Tiempo: ${formatDuration(duracionExamen)} minutos',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButtonMenu(
                      onPressed: () {
                        Get.to(() => RespuestasSelectedScreen());
                      },
                      buttonText: "Ver respuestas",
                    ),
                    MyButtonMenu(
                      onPressed: () {
                        Get.find<QuizzController>().resetearQuizz();
                        Get.until((route) => route.isFirst);
                      },
                      buttonText: "Ir al inicio",
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
