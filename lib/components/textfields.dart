import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

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
