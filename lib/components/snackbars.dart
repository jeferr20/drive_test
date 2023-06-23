import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackCorreoNoValido() {
  Get.snackbar(
    "Email no valido",
    "Ingrese un correo valido",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    isDismissible: false,
    snackPosition: SnackPosition.BOTTOM,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 2),
  );
}

void snackContraNoValida() {
  Get.snackbar(
    "Contraseña no válida",
    "Ingrese una contraseña con mayor seguridad y/o con mmas de 6 caracteres",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: false,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 2),
  );
}

void snackContraCorta() {
  Get.snackbar(
    "Contraseña corta",
    "Ingrese una contraseña con mmas de 6 caracteres",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: false,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 2),
  );
}

void snackContraDebil() {
  Get.snackbar(
    "Contraseña debil",
    "Ingrese una contraseña con mayor seguridad ",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: false,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 2),
  );
}

void snackNombreNoValido() {
  Get.snackbar(
    "Nombre no valido",
    "Ingrese un nombre valido",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: false,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 2),
  );
}

void snackNumeroNoValido() {
  Get.snackbar(
    "Numero no valido",
    "Ingrese un numero valido",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: false,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 2),
  );
}

void snackErrorInicioSesion() {
  Get.snackbar(
    "Error",
    "Error al iniciar sesisón",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: false,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 2),
  );
}

void snackInicioSesionCorrecto() {
  Get.snackbar(
    "Bienvenido",
    "Inicio de sesión correcto",
    colorText: Colors.white,
    backgroundColor: Colors.lightGreen,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: false,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 2),
  );
}

void snackErrorCrearCuenta() {
  Get.snackbar(
    "Error",
    "Error al crear cuenta",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: false,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 2),
  );
}

void snackUsuarioCreado() {
  Get.snackbar(
    "Bienvenido",
    "Usuario creado correctamente",
    colorText: Colors.white,
    backgroundColor: Colors.lightGreen,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: false,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 2),
  );
}

void snackLinkEviado() {
  Get.snackbar(
    "Link enviado",
    "Revise su correo",
    colorText: Colors.white,
    backgroundColor: Colors.lightGreen,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: false,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 2),
  );
}

void snackLinkNoEviado() {
  Get.snackbar(
    "Link no enviado",
    "Intentelo nuevamente",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: false,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 2),
  );
}

void snackUsuarioNoEncontrado() {
  Get.snackbar(
    "Usuario no encontrado",
    "Ingrese un correo registrado",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: false,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 2),
  );
}

void snackPasswordDistintas() {
  Get.snackbar(
    "Contraseñas diferentes",
    "Verifique las contraseñas",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: false,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 2),
  );
}

void snackDatosActualziados() {
  Get.snackbar(
    "Actualización exitosa",
    "Los datos se han actualizado correctamente",
    colorText: Colors.white,
    backgroundColor: Colors.lightGreen,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: false,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 2),
  );
}

void snackPreguntasFaltantes(List<int> preguntasSinResponder) {
  Get.snackbar(
    "Faltan reponder preguntas",
    "Preguntas restantes: ${preguntasSinResponder.join(", ")}",
    colorText: Colors.white,
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: false,
    icon: const Icon(
      Icons.add_alert,
      color: Colors.white,
    ),
    shouldIconPulse: false,
    duration: const Duration(seconds: 2),
  );
}

void dialogFechaNoValida() {
  Get.defaultDialog(
      title: 'Debe ser mayor de 18 años',
      middleText: 'Por favor, seleccione una fecha de nacimiento válida.',
      backgroundColor: Get.theme.colorScheme.background,
      titleStyle: Get.textTheme.headlineMedium,
      middleTextStyle: Get.textTheme.displayMedium,
      radius: 30,
      textCancel: 'Ok',
      titlePadding: const EdgeInsets.all(10),
      contentPadding: const EdgeInsets.all(10));
}

void dialogAbout() {
  Get.defaultDialog(
      title: 'DriveTest',
      middleText:
          'La aplicación móvil DriveTest es una plataforma accesible y personalizable que ayuda a los aspirantes a conductores a prepararse de manera efectiva para el examen de reglas del Ministerio de Transportes y Comunicaciones (MTC). Con contenido completo y actualizado, una interfaz intuitiva, flexibilidad de estudio y un banco de preguntas desafiante, DriveTest busca incrementar las tasas de aprobación y contribuir a un sistema de transporte más seguro y eficiente. Nuestra aplicación ofrece una experiencia de estudio adaptada a las necesidades individuales de cada usuario, brindándoles los recursos necesarios para una preparación exitosa.',
      backgroundColor: Get.theme.colorScheme.background,
      titleStyle: Get.textTheme.headlineMedium,
      middleTextStyle: Get.textTheme.bodySmall,
      radius: 30,
      textCancel: 'Cerrar',
      titlePadding: const EdgeInsets.all(10),
      contentPadding: const EdgeInsets.all(10));
}
