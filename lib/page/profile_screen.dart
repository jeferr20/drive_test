import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drive_test/components/button.dart';
import 'package:drive_test/components/snackbars.dart';
import 'package:drive_test/components/textfields.dart';
import 'package:drive_test/controllers/auth_controller.dart';
import 'package:drive_test/functions/forms_func.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileScreen extends StatefulWidget {
  final bool esDrawer;
  const ProfileScreen({super.key, required this.esDrawer});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthController authController = Get.find();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    final user = authController.user.value;
    if (user != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('correo', isEqualTo: user.email)
          .get();
      if (snapshot.docs.isNotEmpty) {
        final userData = snapshot.docs.first.data();
        setState(() {
          _nameController.text = userData['nombre'] as String? ?? '';
          _emailController.text = user.email!;
          _mobileNumberController.text = userData['celular'] as String? ?? '';
          _selectedDate =
              (userData['fecha_nacimiento'] as Timestamp?)?.toDate();
        });
      }
    }
  }

  void _updateUserData() async {
    final user = authController.user.value;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .where('correo', isEqualTo: user.email)
          .get()
          .then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          final userData = snapshot.docs.first;
          userData.reference.update({
            'nombre': _nameController.text,
            'correo': _emailController.text,
            'celular': _mobileNumberController.text,
            'fecha_nacimiento': _selectedDate != null
                ? Timestamp.fromDate(_selectedDate!)
                : null,
          });
        }
      });
    }
    snackDatosActualziados();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        final ThemeData theme = Theme.of(context);
        final ColorScheme colorScheme = theme.colorScheme;
        if (theme.brightness == Brightness.light) {
          return Theme(
            data: theme.copyWith(
              colorScheme: colorScheme.copyWith(
                primary: Theme.of(context).colorScheme.primary,
              ),
            ),
            child: child!,
          );
        } else {
          // Tema oscuro
          return Theme(
            data: theme.copyWith(
              colorScheme: colorScheme.copyWith(
                primary: Theme.of(context).colorScheme.primary,
              ),
            ),
            child: child!,
          );
        }
      },
    );
    if (picked != null && picked != _selectedDate) {
      final DateTime today = DateTime.now();
      final DateTime legalAgeDate =
          DateTime(today.year - 18, today.month, today.day);
      if (picked.isBefore(legalAgeDate)) {
        setState(() {
          _selectedDate = DateTime(picked.year, picked.month, picked.day);
        });
      } else {
        dialogFechaNoValida();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool nombreValido = false;
    bool celularValido = false;
    return Scaffold(
      appBar: widget.esDrawer
          ? null
          : AppBar(
              title: Text(
                'Perfil',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Container(
              width: 130.0,
              height: 130.0,
              margin: const EdgeInsets.only(
                top: 24.0,
                bottom: 10.0,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: HexColor('#8db8f7'),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                size: 130,
                color: Colors.white,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nombre:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextfieldPerfil(
                  edit: true,
                  controller: _nameController,
                  keyTpye: TextInputType.name,
                  prefixIcon: Icons.person,
                  onSubmitted: (value) {
                    setState(() {
                      nombreValido = validarNombreCompleto(value);
                      if (!nombreValido) {
                        snackNombreNoValido();
                      } else {
                        String capitalizedValue = palabrasMayuculas(value);
                        _nameController.text = capitalizedValue;
                      }
                    });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Correo electrónico:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextfieldPerfil(
                  controller: _emailController,
                  keyTpye: TextInputType.emailAddress,
                  prefixIcon: Icons.mail,
                  edit: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Número de teléfono:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextfieldPerfil(
                  controller: _mobileNumberController,
                  keyTpye: TextInputType.phone,
                  prefixIcon: Icons.phone,
                  edit: true,
                  onSubmitted: (value) {
                    setState(() {
                      celularValido = validarNumero(value);
                      if (!celularValido) {
                        snackNumeroNoValido();
                      }
                    });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Fecha de nacimiento:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                FechaField(
                    selectedDate: _selectedDate,
                    onTap: () => _selectDate(context),
                    prefixIcon: Icons.calendar_view_month),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              onPressed: _updateUserData,
              buttonText: 'Guardar cambios',
            ),
          ],
        ),
      ),
    );
  }
}
