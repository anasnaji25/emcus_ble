import 'package:device_preview/device_preview.dart';
import 'package:emcus_ble/src/const/app_colors.dart';
import 'package:emcus_ble/src/controllers/auth_controller.dart';
import 'package:emcus_ble/src/views/auth_views/register_view.dart';
import 'package:emcus_ble/src/views/auth_views/sign_in_view.dart';
import 'package:emcus_ble/src/views/auth_views/splash_view.dart';
import 'package:emcus_ble/src/views/home_views/bottom_navigation_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  runApp(const MyApp());
  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context) => MyApp(), // Wrap your app
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EMCUS BLE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: SpalshView(),
      // home: BottomNavBarView(),
    );
  }
}
