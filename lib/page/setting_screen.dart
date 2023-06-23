import 'package:drive_test/components/snackbars.dart';
import 'package:drive_test/controllers/theme_controller.dart';
import 'package:drive_test/page/donate_screen.dart';
import 'package:drive_test/page/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text('Mi perfil'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.to(() => const ProfileScreen(esDrawer: false));
              },
            ),
            ListTile(
              title: const Text('Donaciones'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.to(() => const DonateScreen());
              },
            ),
            ListTile(
              title: const Text('Tema oscuro'),
              trailing: Obx(
                () => Switch(
                  value: themeController.themeMode.value == ThemeMode.dark,
                  onChanged: (value) {
                    final newThemeMode =
                        value ? ThemeMode.dark : ThemeMode.light;
                    themeController.changeTheme(newThemeMode);
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text('Acerca de la app'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                dialogAbout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
