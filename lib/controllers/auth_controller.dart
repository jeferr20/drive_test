import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drive_test/components/snackbars.dart';
import 'package:drive_test/page/login_screen.dart';
import 'package:drive_test/page/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instace = Get.find();
  late Rx<User?> user;
  FirebaseAuth auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  @override
  void onReady() {
    super.onReady();
    user = Rx<User?>(auth.currentUser);
    user.bindStream(auth.userChanges());
    ever(user, _initialScreen);
  }

  _initialScreen(User? user) async {
    if (user == null) {
      Get.offAll(() => const LoginScreen());
    } else {
      final userName = await conseguirNombre();
      Get.offAll(() => WelcomeScreen(
            email: user.email!,
            userName: userName ?? 'Nombre de usuario',
          ));
    }
  }

  bool passwordConfirmed(String password, confirmpassword) {
    if (password == confirmpassword) {
      return true;
    } else {
      return false;
    }
  }

  Future addDatos(String name, String email, String mobileNumber) async {
    await FirebaseFirestore.instance.collection('users').add({
      'nombre': name,
      'correo': email,
      'celular': mobileNumber,
    });
  }

  void registrarUsuario(
      String email, password, confirmpassword, name, mobileNumber) async {
    try {
      if (passwordConfirmed(password, confirmpassword)) {
        snackUsuarioCreado();
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        addDatos(name, email, mobileNumber);
      } else {
        snackPasswordDistintas();
      }
    } catch (e) {
      snackErrorCrearCuenta();
    }
  }

  void loginUsuario(BuildContext context, String email, password,
      bool emailValido, bool contraValido) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      snackInicioSesionCorrecto();
    } catch (e) {
      snackErrorInicioSesion();
    }
  }

  void cerrarSesion() {
    FirebaseAuth.instance.signOut();
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await auth.signInWithCredential(credential);
      }
    } catch (e) {
      Get.snackbar('Error', 'Error durante la autenticación con Google.');
    }
  }

  Future passwordReset(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      snackLinkEviado();
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          snackUsuarioNoEncontrado();
        }
      } else {
        {
          snackLinkNoEviado();
        }
      }
    }
  }

  Future<String?> conseguirNombre() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('correo', isEqualTo: currentUser.email)
            .get();
        if (snapshot.docs.isNotEmpty) {
          final userData = snapshot.docs.first.data();
          return userData['nombre'] as String?;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
