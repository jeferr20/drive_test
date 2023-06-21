class Pregunta {
  final String enunciado;
  //final String? imagenUrl;
  final List<String> opciones;
  final int respuestaCorrecta;

  Pregunta({
    required this.enunciado,
    //this.imagenUrl,
    required this.opciones,
    required this.respuestaCorrecta,
  });
}
