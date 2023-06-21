import 'package:drive_test/models/pregunta_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PreguntasController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<Pregunta> _preguntas = RxList<Pregunta>([]);
  final RxInt _indiceActual = 0.obs;

  List<Pregunta> get preguntas => _preguntas;
  int get indiceActual => _indiceActual.value;

  @override
  void onReady() {
    super.onReady();
    _loadPreguntas('preguntas_A1');
  }

  Future<void> _loadPreguntas(String nombreColeccion) async {
    final snapshot = await _firestore.collection(nombreColeccion).get();
    _preguntas.value = snapshot.docs
        .map((doc) => Pregunta(
              enunciado: doc['enunciado'],
              //imagenUrl: doc['imagenUrl'],
              opciones: List<String>.from(doc['opciones']),
              respuestaCorrecta: doc['respuestaCorrecta'],
            ))
        .toList();
  }

  void cargarPreguntas(String categoria) async {
    String nombreColeccion;
    switch (categoria) {
      case 'Categoría A-I':
        nombreColeccion = 'preguntas_A1';
        break;
      case 'Categoría A-II-A':
        nombreColeccion = 'preguntas_A2A';
        break;
      case 'Categoría A-II-B':
        nombreColeccion = 'preguntas_A2B';
        break;
      case 'Categoría A-III-A':
        nombreColeccion = 'preguntas_A3A';
        break;
      case 'Categoría A-III-B':
        nombreColeccion = 'preguntas_A3B';
        break;
      case 'Categoría A-III-C':
        nombreColeccion = 'preguntas_A3C';
        break;
      case 'Categoría B-II-A':
        nombreColeccion = 'preguntas_B2A';
        break;
      case 'Categoría B-II-B':
        nombreColeccion = 'preguntas_B2B';
        break;
      case 'Categoría B-II-C':
        nombreColeccion = 'preguntas_B2C';
        break;
      default:
        nombreColeccion = 'preguntas_A1';
    }
    await _loadPreguntas(nombreColeccion);
    _indiceActual.value = 0;
  }

  void avanzarPregunta() {
    if (indiceActual < preguntas.length - 1) {
      _indiceActual.value++;
    }
  }

  void retrocederPregunta() {
    if (indiceActual > 0) {
      _indiceActual.value--;
    }
  }
}
