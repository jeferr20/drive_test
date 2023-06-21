bool validarNombreCompleto(String nombreCompleto) {
  RegExp regex = RegExp(r'^[a-zA-Z\s]+$');
  return regex.hasMatch(nombreCompleto);
}

String palabrasMayuculas(String text) {
  List<String> nombre = text.split(' ');
  for (int i = 0; i < nombre.length; i++) {
    if (nombre[i].isNotEmpty) {
      nombre[i] = nombre[i][0].toUpperCase() + nombre[i].substring(1);
    }
  }
  String nombreMayuscula = nombre.join(' ');
  return nombreMayuscula;
}

bool validarNumero(String numero) {
  if (numero.length == 9 && numero.startsWith('9')) {
    return true; // Número de teléfono válido
  } else {
    return false; // Número de teléfono no válido
  }
}
