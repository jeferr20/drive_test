import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drive_test/models/infracciones.dart';
import 'package:get/get.dart';

class InfraccionesController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final RxList<Infracciones> infracciones = <Infracciones>[].obs;

  @override
  void onInit() {
    fetchInfracciones();
    super.onInit();
  }

  Future<void> fetchInfracciones() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('infracciones').get();

    final List<Infracciones> infraccionesList = snapshot.docs.map((doc) {
      final data = doc.data();
      return Infracciones(
        codigo: data['codigo'],
        infraccion: data['infraccion'],
        monto: data['monto'],
        puntos: data['puntos'],
        medidaPreventiva: data['medidaPreventiva'],
        sancion: data['sancion'],
      );
    }).toList();

    infracciones.assignAll(infraccionesList);
  }
}
