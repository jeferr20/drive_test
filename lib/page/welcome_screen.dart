import 'package:drive_test/controllers/auth_controller.dart';
import 'package:drive_test/page/infracciones_screen.dart';
import 'package:drive_test/page/licencias_screen.dart';
import 'package:drive_test/page/map_screen.dart';
import 'package:drive_test/page/profile_screen.dart';
import 'package:drive_test/page/resultados_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:hexcolor/hexcolor.dart';

class WelcomeScreen extends StatefulWidget {
  final String email;
  final String userName;
  const WelcomeScreen({super.key, required this.email, required this.userName});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  final _advancedDrawerController = AdvancedDrawerController();
  String titulo = 'Inicio';
  Widget _currentScreen = const LicenciasScreen();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      openScale: 0.95,
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              HexColor('#0c5fcf').withOpacity(0.5)
            ],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 250),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
                // child: Image.asset(
                //   'assets/study.png',
                //   fit: BoxFit.cover,
                // ),
              ),
              TextButton(
                child: Text(
                  widget.userName,
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _currentScreen = const ProfileScreen();
                    titulo = 'Perfil';
                  });
                  _advancedDrawerController.hideDrawer();
                },
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    _currentScreen = const LicenciasScreen();
                    titulo = 'Inicio';
                  });
                  _advancedDrawerController.hideDrawer();
                },
                leading: const Icon(Icons.home),
                title: Text(
                  'Inicio',
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    _currentScreen = const ResultadosScreen();
                    titulo = 'Resultados';
                  });
                  _advancedDrawerController.hideDrawer();
                },
                leading: const Icon(Icons.bar_chart),
                title: Text(
                  'Resultados',
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    _currentScreen = InfraccionesScreen();
                    titulo = 'Lista de Infracciones';
                  });
                  _advancedDrawerController.hideDrawer();
                },
                leading: const Icon(Icons.dangerous),
                title: Text(
                  'Lista de Infracciones',
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    _currentScreen = const MapScreen();
                    titulo = 'Centros de evaluaciones';
                  });
                  _advancedDrawerController.hideDrawer();
                },
                leading: const Icon(Icons.map),
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  'Centros de evaluaciones',
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  AuthController.instace.cerrarSesion();
                },
                leading: const Icon(Icons.logout),
                title: Text(
                  'Cerrar sesión',
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(titulo, style: Theme.of(context).textTheme.titleLarge),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: _currentScreen,
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
