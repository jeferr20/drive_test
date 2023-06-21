import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drive_test/components/snackbars.dart';
import 'package:drive_test/page/resultado_quizz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

String getCategoy(String categoria) {
  switch (categoria) {
    case 'Categoría A-I':
      return 'A-I';
    case 'Categoría A-II-A':
      return 'A-II-A';
    case 'Categoría A-II-B':
      return 'A-II-B';
    case 'Categoría A-III-A':
      return 'A-III-A';
    case 'Categoría A-III-B':
      return 'A-III-B';
    case 'Categoría A-III-C':
      return 'A-III-C';
    case 'Categoría B-II-A':
      return 'B-II-A';
    case 'Categoría B-II-B':
      return 'B-II-B';
    case 'Categoría B-II-C':
      return 'B-II-C';
    default:
      return 'CATEGORIA';
  }
}

String formatDuration(int seconds) {
  final int minutes = (seconds / 60).floor();
  final int remainingSeconds = seconds % 60;

  return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
}

void calcularResultados(
    List<Map<String, dynamic>> preguntas, int tiempoTranscurrido) {
  int preguntasCorrectas = 0;
  List<Map<String, dynamic>> resultados = [];
  List<int> preguntasSinResponder = [];
  for (var i = 0; i < preguntas.length; i++) {
    final pregunta = preguntas[i];
    final respuestaSeleccionada = pregunta['respuestaSeleccionada'];
    final respuestaCorrecta = pregunta['respuestaCorrecta'];
    bool esRespuestaCorrecta = false;

    if (respuestaSeleccionada != null &&
        respuestaSeleccionada == respuestaCorrecta) {
      esRespuestaCorrecta = true;
      preguntasCorrectas++;
    }
    resultados.add({
      'pregunta': pregunta['enunciado'],
      'opciones': pregunta['opciones'],
      'respuestaSeleccionada': respuestaSeleccionada,
      'respuestaCorrecta': respuestaCorrecta,
      'esRespuestaCorrecta': esRespuestaCorrecta,
    });

    if (respuestaSeleccionada == null) {
      preguntasSinResponder.add(i + 1);
    }
  }
  if (preguntasSinResponder.isNotEmpty) {
    snackPreguntasFaltantes(preguntasSinResponder);
    return; // Salir del método sin calcular los resultados
  }
  final firestore = FirebaseFirestore.instance;
  final DocumentReference quizRef = firestore.collection('quizzes').doc();
  final String quizId = quizRef.id;
  final duracionExamen = tiempoTranscurrido;
  final categoriaSelect = Get.arguments;
  final user = FirebaseAuth.instance.currentUser!;
  firestore.collection('quizzes').doc(quizId).set({
    'categoria': categoriaSelect.value,
    'preguntas': resultados,
    'preguntasCorrectas': preguntasCorrectas,
    'totalPreguntas': preguntas.length,
    'duracionExamen': duracionExamen,
    'timestamp': FieldValue.serverTimestamp(),
    'email': user.email,
  }).then((_) {
    Get.off(() => ResultadoQuizzScreen(), arguments: quizId);
  });
}
