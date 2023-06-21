import 'package:drive_test/components/button.dart';
import 'package:drive_test/components/snackbars.dart';
import 'package:drive_test/components/textfields.dart';
import 'package:drive_test/controllers/auth_controller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  final _emailNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    bool emailValido = EmailValidator.validate(_emailController.text.trim());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Olvidé mi contraseña",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ingresa tu correo electrónico y te enviaremos un link para cambiar tu contraseña",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            MyTextfield(
              hintText: "Ingresa tu correo",
              prefixIcon: Icons.mail_outline,
              keyTpye: TextInputType.emailAddress,
              controller: _emailController,
              node: _emailNode,
              onSubmitted: (value) {
                setState(() {
                  emailValido = EmailValidator.validate(value);
                  if (!emailValido) {
                    snackCorreoNoValido();
                  }
                });
              },
            ),
            const SizedBox(
              height: 15,
            ),
            MyButton(
              onPressed: () {
                AuthController.instace
                    .passwordReset(_emailController.text.trim());
              },
              buttonText: 'Restaurar contraseña',
            ),
          ],
        ),
      )),
    );
  }
}
