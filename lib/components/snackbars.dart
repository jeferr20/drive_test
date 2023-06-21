import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackCorreoNoValido() {
  Get.snackbar(
    "Email no valido",
    "Ingrese un correo valido",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 3),
  );
}

void snackContraNoValida() {
  Get.snackbar(
    "Contraseña no válida",
    "Ingrese una contraseña con mayor seguridad y/o con mmas de 6 caracteres",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 3),
  );
}

void snackContraCorta() {
  Get.snackbar(
    "Contraseña corta",
    "Ingrese una contraseña con mmas de 6 caracteres",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 3),
  );
}

void snackContraDebil() {
  Get.snackbar(
    "Contraseña debil",
    "Ingrese una contraseña con mayor seguridad ",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 3),
  );
}

void snackNombreNoValido() {
  Get.snackbar(
    "Nombre no valido",
    "Ingrese un nombre valido",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 3),
  );
}

void snackNumeroNoValido() {
  Get.snackbar(
    "Numero no valido",
    "Ingrese un numero valido",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 3),
  );
}

void snackErrorInicioSesion() {
  Get.snackbar(
    "Error",
    "Error al iniciar sesisón",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 3),
  );
}

void snackInicioSesionCorrecto() {
  Get.snackbar(
    "Bienvenido",
    "Inicio de sesión correcto",
    colorText: Colors.white,
    backgroundColor: Colors.lightGreen,
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 3),
  );
}

void snackErrorCrearCuenta() {
  Get.snackbar(
    "Error",
    "Error al crear cuenta",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 3),
  );
}

void snackUsuarioCreado() {
  Get.snackbar(
    "Bienvenido",
    "Usuario creado correctamente",
    colorText: Colors.white,
    backgroundColor: Colors.lightGreen,
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 3),
  );
}

void snackLinkEviado() {
  Get.snackbar(
    "Link enviado",
    "Revise su correo",
    colorText: Colors.white,
    backgroundColor: Colors.lightGreen,
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 3),
  );
}

void snackLinkNoEviado() {
  Get.snackbar(
    "Link no enviado",
    "Intentelo nuevamente",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 3),
  );
}

void snackUsuarioNoEncontrado() {
  Get.snackbar(
    "Usuario no encontrado",
    "Ingrese un correo registrado",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 3),
  );
}

void snackPasswordDistintas() {
  Get.snackbar(
    "Contraseñas diferentes",
    "Verifique las contraseñas",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 3),
  );
}

void snackPreguntasFaltantes(List<int> preguntasSinResponder) {
  Get.snackbar(
    "Faltan reponder preguntas",
    "Preguntas restantes: ${preguntasSinResponder.join(", ")}",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 3),
  );
}
