import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class QuizzController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<Map<String, dynamic>> _preguntasQuizz =
      RxList<Map<String, dynamic>>([]);
  final RxInt _indiceActual = 0.obs;

  List<Map<String, dynamic>> get preguntasQuizz => _preguntasQuizz;
  int get indiceActual => _indiceActual.value;

  @override
  void onReady() {
    super.onReady();
    _loadQuizzPreguntas();
  }

  Future<void> _loadQuizzPreguntas() async {
    final snapshot = await _firestore.collection('preguntas_A1').get();
    final List<Map<String, dynamic>> preguntas =
        snapshot.docs.map((doc) => doc.data()).toList();
    final List<Map<String, dynamic>> preguntasQuizz = [];
    final random = Random();

    // Obtener 10 preguntas aleatorias
    while (preguntas.isNotEmpty && preguntasQuizz.length < 10) {
      final index = random.nextInt(preguntas.length);
      preguntasQuizz.add(preguntas[index]);
      preguntas.removeAt(index);
    }
    _preguntasQuizz.value = preguntasQuizz;
    _indiceActual.value = 0;
  }

  void avanzarPregunta() {
    if (indiceActual < preguntasQuizz.length - 1) {
      _indiceActual.value++;
    }
  }

  void retrocederPregunta() {
    if (indiceActual > 0) {
      _indiceActual.value--;
    }
  }

  void resetearQuizz() {
    _preguntasQuizz.clear();
    _indiceActual.value = 0;
    _loadQuizzPreguntas();
  }

  void setIndiceInicial() {
    _indiceActual.value = 0;
  }
}
