import 'package:drive_test/models/infracciones.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class InfraccionesWidget extends StatelessWidget {
  final Infracciones infracciones;
  final Color colorcodigo;
  final Function()? onTap;
  const InfraccionesWidget(
      {super.key,
      required this.infracciones,
      required this.colorcodigo,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          height: 70,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colorcodigo,
                ),
                child: Center(
                  child: Text(infracciones.codigo,
                      style: Theme.of(context).textTheme.titleLarge),
                ),
              ),
              Text('Monto a pagar: S/${infracciones.monto}',
                  style: Theme.of(context).textTheme.bodySmall),
              Text(
                'Puntos: ${infracciones.puntos}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          color: Colors.red,
          size: 35,
        ),
        Text(
          'No se ha encontrado el código de la infracción',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class InfraccionDetails extends StatelessWidget {
  final Infracciones infracciones;
  final Color colorCodigo;
  const InfraccionDetails({
    super.key,
    required this.colorCodigo,
    required this.infracciones,
  });

  @override
  Widget build(BuildContext context) {
    return InfraccionesWidget(
      infracciones: infracciones,
      colorcodigo: colorCodigo,
      onTap: () {
        Dialogs.materialDialog(
            color: Theme.of(context).colorScheme.background,
            context: context,
            actions: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('INFRACCIÓN ${infracciones.codigo}',
                            style: Theme.of(context).textTheme.headlineMedium)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Descripción: ',
                            style: Theme.of(context).textTheme.titleMedium,
                            children: <TextSpan>[
                          TextSpan(
                              text: infracciones.infraccion,
                              style: Theme.of(context).textTheme.titleSmall)
                        ])),
                    RichText(
                        text: TextSpan(
                            text: 'Monto a pagar: ',
                            style: Theme.of(context).textTheme.titleMedium,
                            children: <TextSpan>[
                          TextSpan(
                              text: 'S/${infracciones.monto}',
                              style: Theme.of(context).textTheme.titleSmall)
                        ])),
                    RichText(
                        text: TextSpan(
                            text: 'Puntos a descontar: ',
                            style: Theme.of(context).textTheme.titleMedium,
                            children: <TextSpan>[
                          TextSpan(
                              text: '${infracciones.puntos}',
                              style: Theme.of(context).textTheme.titleSmall)
                        ])),
                    RichText(
                        text: TextSpan(
                            text: 'Sanción: ',
                            style: Theme.of(context).textTheme.titleMedium,
                            children: <TextSpan>[
                          TextSpan(
                              text: infracciones.sancion,
                              style: Theme.of(context).textTheme.titleSmall)
                        ])),
                    RichText(
                        text: TextSpan(
                            text: 'Medida Preventiva: ',
                            style: Theme.of(context).textTheme.titleMedium,
                            children: <TextSpan>[
                          TextSpan(
                              text: infracciones.medidaPreventiva,
                              style: Theme.of(context).textTheme.titleSmall)
                        ])),
                    IconsOutlineButton(
                      onPressed: () {
                        Get.back();
                      },
                      text: 'Cerrar',
                      iconData: Icons.cancel_outlined,
                      textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                      iconColor: Theme.of(context).colorScheme.secondary,
                    )
                  ],
                ),
              )
            ]);
      },
    );
  }
}
