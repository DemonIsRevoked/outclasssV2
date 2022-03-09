import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outclassv3/Services/authentication.dart';
import 'package:outclassv3/Services/colorses.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final DataController controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Get.off(UserInstanceManagement().handleAuth());
    });

    return Scaffold(
      body: Container(
        color: colorMain4,
        alignment: Alignment.center,
        child: const Text(
          'OUTCLASS',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold /**/),
        ),
      ),
    );
  }
}
