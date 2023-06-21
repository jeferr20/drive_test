import 'package:flutter/material.dart';

class WidgetModo extends StatelessWidget {
  final Function()? onPressed;
  final String titulo;
  final String imagenURL;
  const WidgetModo(
      {super.key,
      this.onPressed,
      required this.titulo,
      required this.imagenURL});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                imagenURL,
                width: MediaQuery.of(context).size.height * 0.27,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Text(
                titulo,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              )
            ],
          )),
    );
  }
}

class WidgetModernCategory extends StatelessWidget {
  final Function()? onPressed;
  final String titulo;
  final String vehiculos;
  final String imagenURL;
  const WidgetModernCategory(
      {super.key,
      required this.titulo,
      required this.vehiculos,
      required this.imagenURL,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        //width: 350,
        height: 80,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
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
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                image: DecorationImage(
                    image: AssetImage(imagenURL), fit: BoxFit.contain),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titulo,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  vehiculos,
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
