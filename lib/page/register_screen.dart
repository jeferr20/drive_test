import 'package:drive_test/components/button.dart';
import 'package:drive_test/components/snackbars.dart';
import 'package:drive_test/components/textfields.dart';
import 'package:drive_test/controllers/auth_controller.dart';
import 'package:drive_test/functions/forms_func.dart';
import 'package:drive_test/page/login_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_strength/password_strength.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordVisible1 = true;
  bool passwordVisible2 = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _cellphoneController = TextEditingController();
  final FocusNode _textFieldFocusNode1 = FocusNode();
  final FocusNode _textFieldFocusNode2 = FocusNode();
  final FocusNode _textFieldFocusNode3 = FocusNode();
  final FocusNode _textFieldFocusNode4 = FocusNode();
  final FocusNode _textFieldFocusNode5 = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _cellphoneController.dispose();
    _textFieldFocusNode1.dispose();
    _textFieldFocusNode2.dispose();
    _textFieldFocusNode3.dispose();
    _textFieldFocusNode4.dispose();
    _textFieldFocusNode5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    bool emailValido = EmailValidator.validate(_emailController.text.trim());
    bool contraValido = true;
    bool confirmContraValido = false;
    bool nombreValido = false;
    bool celularValido = false;
    double passwordValido1, passwordValido2;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logoDriveTest.png', width: w, height: h * 0.22),
            Container(
              height: h - h * 0.22,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Registrarse",
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    MyTextfield(
                      hintText: "Correo",
                      prefixIcon: Icons.mail_outline,
                      keyTpye: TextInputType.emailAddress,
                      controller: _emailController,
                      node: _textFieldFocusNode1,
                      onSubmitted: (value) {
                        setState(() {
                          emailValido = EmailValidator.validate(value);
                          if (!emailValido) {
                            snackCorreoNoValido();
                          } else {
                            FocusScope.of(context)
                                .requestFocus(_textFieldFocusNode2);
                          }
                        });
                      },
                    ),
                    MyPassField(
                      hintText: "Contraseña",
                      controller: _passwordController,
                      node: _textFieldFocusNode2,
                      onSubmitted: (value) {
                        setState(() {
                          passwordValido1 = estimatePasswordStrength(
                              _passwordController.text.trim());
                          contraValido = true;
                          if (passwordValido1 < 0.1 &&
                              _passwordController.text.length < 6) {
                            contraValido = false;
                            snackContraNoValida();
                          } else if (_passwordController.text.length < 6) {
                            contraValido = false;
                            snackContraCorta();
                          } else if (passwordValido1 < 0.1) {
                            contraValido = false;
                            snackContraDebil();
                          } else {
                            FocusScope.of(context)
                                .requestFocus(_textFieldFocusNode3);
                          }
                        });
                      },
                    ),
                    MyPassField(
                      hintText: "Confirma tu contraseña",
                      controller: _confirmPasswordController,
                      node: _textFieldFocusNode3,
                      onSubmitted: (value) {
                        setState(() {
                          passwordValido2 = estimatePasswordStrength(
                              _confirmPasswordController.text.trim());
                          confirmContraValido = true;
                          if (passwordValido2 < 0.1 &&
                              _confirmPasswordController.text.length < 6) {
                            confirmContraValido = false;
                            snackContraNoValida();
                          } else if (_confirmPasswordController.text.length <
                              6) {
                            confirmContraValido = false;
                            snackContraCorta();
                          } else if (passwordValido2 < 0.1) {
                            confirmContraValido = false;
                            snackContraDebil();
                          } else {
                            FocusScope.of(context)
                                .requestFocus(_textFieldFocusNode4);
                          }
                        });
                      },
                    ),
                    MyTextfield(
                      hintText: "Nombre Completo",
                      prefixIcon: Icons.person,
                      keyTpye: TextInputType.name,
                      controller: _nameController,
                      node: _textFieldFocusNode4,
                      onSubmitted: (value) {
                        setState(() {
                          nombreValido = validarNombreCompleto(value);
                          if (!nombreValido) {
                            snackNombreNoValido();
                          } else {
                            String capitalizedValue = palabrasMayuculas(value);
                            _nameController.text = capitalizedValue;
                            FocusScope.of(context)
                                .requestFocus(_textFieldFocusNode5);
                          }
                        });
                      },
                    ),
                    MyTextfield(
                      hintText: "Celular",
                      prefixIcon: Icons.phone,
                      keyTpye: TextInputType.number,
                      controller: _cellphoneController,
                      node: _textFieldFocusNode5,
                      onSubmitted: (value) {
                        setState(() {
                          celularValido = validarNumero(value);
                          if (!celularValido) {
                            snackNumeroNoValido();
                          } else {
                            _textFieldFocusNode5.unfocus();
                          }
                        });
                      },
                    ),
                    MyButton(
                        buttonText: 'REGISTRAR',
                        onPressed: () {
                          AuthController.instace.registrarUsuario(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                              _confirmPasswordController.text.trim(),
                              _nameController.text.trim(),
                              _cellphoneController.text.trim());
                        }),
                    RichText(
                      text: TextSpan(
                          text: '¿Ya tienes una cuenta? ',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(() => const LoginScreen());
                                },
                              text: ' Ingresa aqui',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
