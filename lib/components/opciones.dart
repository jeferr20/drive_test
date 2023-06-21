import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OpcionesPreguntas extends StatelessWidget {
  final String texto;
  final Color color;
  final Color colorLetra;
  final VoidCallback? ontap;
  const OpcionesPreguntas(
      {super.key,
      required this.color,
      required this.texto,
      required this.colorLetra,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        //height: 70,
        //width: 270,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          texto,
          style: GoogleFonts.poppins(
            color: colorLetra,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
