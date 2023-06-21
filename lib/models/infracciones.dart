class Infracciones {
  final String codigo;
  final String infraccion;
  final int monto;
  final int puntos;
  final String? medidaPreventiva;
  final String sancion;

  Infracciones({
    required this.codigo,
    required this.infraccion,
    required this.monto,
    required this.puntos,
    this.medidaPreventiva,
    required this.sancion,
  });
}
