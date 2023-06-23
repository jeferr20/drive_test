import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class MyTextfield extends StatefulWidget {
  final TextInputType keyTpye;
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final FocusNode node;
  final Function(String)? onSubmitted;
  const MyTextfield({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.keyTpye,
    required this.controller,
    required this.node,
    this.onSubmitted,
  });

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.node,
      controller: widget.controller,
      keyboardType: widget.keyTpye,
      cursorColor: HexColor("#8d8d8d"),
      obscureText: false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        fillColor: HexColor("#f0f3f1"),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintStyle: GoogleFonts.poppins(
          fontSize: 15,
          color: HexColor("#8d8d8d"),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(widget.prefixIcon),
        prefixIconColor: HexColor("#8d8d8d"),
        filled: true,
      ),
      style: GoogleFonts.poppins(
        fontSize: 15,
        color: HexColor("#8d8d8d"),
      ),
      onSubmitted: widget.onSubmitted,
    );
  }
}

class MyPassField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode node;
  final Function(String)? onSubmitted;
  const MyPassField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.node,
      this.onSubmitted});

  @override
  State<MyPassField> createState() => _MyPassFieldState();
}

class _MyPassFieldState extends State<MyPassField> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.node,
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      cursorColor: HexColor("#8d8d8d"),
      obscureText: passwordVisible,
      decoration: InputDecoration(
        hintText: widget.hintText,
        fillColor: HexColor("#f0f3f1"),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        hintStyle: GoogleFonts.poppins(
          fontSize: 15,
          color: HexColor("#8d8d8d"),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.lock_outline),
        prefixIconColor: HexColor("#8d8d8d"),
        filled: true,
        suffixIcon: IconButton(
          color: HexColor("#8d8d8d"),
          icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        ),
        alignLabelWithHint: false,
      ),
      style: GoogleFonts.poppins(
        fontSize: 15,
        color: HexColor("#8d8d8d"),
      ),
      onSubmitted: widget.onSubmitted,
    );
  }
}

class FechaField extends StatefulWidget {
  final IconData prefixIcon;
  final Function()? onTap;
  final DateTime? selectedDate;
  const FechaField(
      {super.key, this.onTap, required this.prefixIcon, this.selectedDate});

  @override
  State<FechaField> createState() => _FechaFieldState();
}

class _FechaFieldState extends State<FechaField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        decoration: BoxDecoration(
          color: HexColor("#f0f3f1"),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_month,
              color: HexColor("#8d8d8d"),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.selectedDate != null
                  ? DateFormat('dd/MM/yyyy').format(widget.selectedDate!)
                  : 'Seleccionar fecha',
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: HexColor("#8d8d8d"),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class TextfieldPerfil extends StatefulWidget {
  final TextInputType keyTpye;
  final TextEditingController controller;
  final IconData prefixIcon;
  final bool edit;
  final Function(String)? onSubmitted;
  const TextfieldPerfil({
    super.key,
    required this.controller,
    required this.keyTpye,
    required this.prefixIcon,
    required this.edit,
    this.onSubmitted,
  });

  @override
  State<TextfieldPerfil> createState() => _TextfieldPerfilState();
}

class _TextfieldPerfilState extends State<TextfieldPerfil> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.edit,
      controller: widget.controller,
      keyboardType: widget.keyTpye,
      cursorColor: HexColor("#8d8d8d"),
      obscureText: false,
      decoration: InputDecoration(
        fillColor: HexColor("#f0f3f1"),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(widget.prefixIcon),
        prefixIconColor: HexColor("#8d8d8d"),
        filled: true,
      ),
      style: GoogleFonts.poppins(
          fontSize: 15,
          color: HexColor("#8d8d8d"),
          fontWeight: FontWeight.w600),
      onSubmitted: widget.onSubmitted,
    );
  }
}
