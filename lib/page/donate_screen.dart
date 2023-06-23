import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Donaciones',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.width - 30,
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
              color: HexColor('#742384'),
              image: const DecorationImage(
                  image: AssetImage(
                    'assets/qr.png',
                  ),
                  scale: 1.7),
              borderRadius: BorderRadius.circular(35)),
        ),
      ),
    );
  }
}
