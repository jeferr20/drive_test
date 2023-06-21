import 'package:drive_test/components/button.dart';
import 'package:drive_test/components/snackbars.dart';
import 'package:drive_test/components/textfields.dart';
import 'package:drive_test/controllers/auth_controller.dart';
import 'package:drive_test/page/register_screen.dart';
import 'package:drive_test/page/reset_password_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:password_strength/password_strength.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FocusNode _textFieldFocusNode1 = FocusNode();
  final FocusNode _textFieldFocusNode2 = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _textFieldFocusNode1.dispose();
    _textFieldFocusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    bool emailValido = EmailValidator.validate(_emailController.text.trim());
    bool contraValido = false;
    double passwordValido;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logoDriveTest.png', width: w, height: h * 0.25),
            Container(
              height: 588,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Iniciar sesión",
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Correo",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        MyTextfield(
                          hintText: "hola@gmail.com",
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
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Contraseña",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        MyPassField(
                          hintText: "Contraseña",
                          controller: _passwordController,
                          node: _textFieldFocusNode2,
                          onSubmitted: (value) {
                            setState(() {
                              passwordValido = estimatePasswordStrength(
                                  _passwordController.text.trim());
                              contraValido = true;
                              if (passwordValido < 0.1 &&
                                  _passwordController.text.length < 6) {
                                contraValido = false;
                                snackContraNoValida();
                              } else if (_passwordController.text.length < 6) {
                                contraValido = false;
                                snackContraCorta();
                              } else if (passwordValido < 0.1) {
                                contraValido = false;
                                snackContraDebil();
                              } else {
                                _textFieldFocusNode2.unfocus();
                              }
                            });
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () =>
                                    Get.to(() => const ForgotPassword()),
                                child: Text(
                                  'Olvidé mi contraseña',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                    MyButton(
                      onPressed: () {
                        AuthController.instace.loginUsuario(
                            context,
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                            emailValido,
                            contraValido);
                      },
                      buttonText: 'INGRESAR',
                    ),
                    GoogleButton(
                      onPressed: () {
                        AuthController.instace.signInWithGoogle();
                      },
                    ),
                    RichText(
                      text: TextSpan(
                          text: '¿Aún no estas registrado? ',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(() => const RegisterScreen());
                                },
                              text: ' Registrate aqui',
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
            ),
          ],
        ),
      ),
    );
  }
}
