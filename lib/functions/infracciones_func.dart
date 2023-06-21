import 'package:flutter/material.dart';

Color getColorCodigo(String codigo) {
  if (codigo.startsWith('L')) {
    return Colors.green;
  } else if (codigo.startsWith('M')) {
    return Colors.red;
  } else if (codigo.startsWith('G')) {
    return const Color.fromARGB(255, 255, 209, 3);
  } else {
    return Colors.black;
  }
}
