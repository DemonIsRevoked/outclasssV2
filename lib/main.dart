//external files-------------
import 'package:firebase_core/firebase_core.dart';
//bottom nav bar -----------------
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:outclassv3/Pages/flashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
  // runApp(UserManagement().handleAuth());
}
//Color scheme ============================