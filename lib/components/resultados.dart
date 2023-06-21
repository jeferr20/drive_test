import 'package:drive_test/functions/resultados_func.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ResultadosPasados extends StatelessWidget {
  final String categoriaExamen;
  final int duracion;
  final int rptaCorrecta;
  final int rptaIncorrecta;
  final Color colorBc;
  const ResultadosPasados({
    super.key,
    required this.categoriaExamen,
    required this.duracion,
    required this.rptaCorrecta,
    required this.rptaIncorrecta,
    required this.colorBc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 135,
      decoration: BoxDecoration(
          color: colorBc,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              //color: Color.fromARGB(255, 255, 136, 0),
              // image: DecorationImage(
              //     image: AssetImage(imagenURL), fit: BoxFit.contain),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(categoriaExamen,
                style: Theme.of(context).textTheme.titleLarge),
          ),
          SizedBox(
            width: 210,
            //color: Colors.amberAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Correctas',
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 43,
                          width: 43,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ]),
                          child: Text(
                            rptaCorrecta.toString(),
                            style: GoogleFonts.poppins(
                              color: HexColor("#00e272"),
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Text('Incorrectas',
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 43,
                          width: 43,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ]),
                          child: Text(
                            rptaIncorrecta.toString(),
                            style: GoogleFonts.poppins(
                              color: HexColor("#fa4b42"),
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tiempo',
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ]),
                      child: Text(formatDuration(duracion),
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
