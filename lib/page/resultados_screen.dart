import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drive_test/components/resultados.dart';
import 'package:drive_test/functions/resultados_func.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ResultadosScreen extends StatelessWidget {
  const ResultadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userExams = FirebaseFirestore.instance
        .collection('quizzes')
        .where('email', isEqualTo: currentUser?.email)
        .orderBy('timestamp', descending: true)
        .limit(10)
        .snapshots();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Últimos 10 exámenes realizados',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: userExams,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (!snapshot.hasData ||
                      snapshot.data?.docs.isEmpty == true) {
                    return const Text('Aun no has realizado ningún examen.');
                  }
                  return Column(
                    children: snapshot.data!.docs.map((doc) {
                      final examData = doc.data() as Map<String, dynamic>;
                      final esPerfet = examData['preguntasCorrectas'] ==
                          examData['totalPreguntas'];
                      final colorback = esPerfet
                          ? HexColor("#FFD700")
                          : Theme.of(context).colorScheme.background;
                      return Column(
                        children: [
                          ResultadosPasados(
                            categoriaExamen: getCategoy(examData['categoria']),
                            duracion: examData['duracionExamen'],
                            rptaCorrecta: examData['preguntasCorrectas'],
                            rptaIncorrecta: examData['totalPreguntas'] -
                                examData['preguntasCorrectas'],
                            colorBc: colorback,
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
