import 'package:emcus_ble/src/const/app_colors.dart';
import 'package:emcus_ble/src/const/app_images.dart';
import 'package:emcus_ble/src/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SpalshView extends StatefulWidget {
  const SpalshView({super.key});

  @override
  State<SpalshView> createState() => _SpalshViewState();
}

class _SpalshViewState extends State<SpalshView> {
  @override
  void initState() {
    super.initState();
    redirectToNextScreen();
  }

  redirectToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.find<AuthController>().checkIfUserIsLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const  BoxDecoration(
                        gradient: LinearGradient(
                          tileMode:TileMode.decal ,
                          colors: [
                            secondaryColor,
                            Color.fromARGB(255, 119, 8, 15),
                          ],
                        ),
                      ),
                      // Add child widgets here
                    )),
                Expanded(
                    flex: 4,
                    child: Container(
                      decoration: const BoxDecoration(color: primaryColor),
                    ))
              ],
            ),
          ),
          Positioned(
              left: 0,
              top: size.height * 0.3,
              child: Image.asset(
                splashDeviceImage,
                height: 170,
              )),
          Positioned(
              right: 50,
              top: size.height * 0.47,
              child: Image.asset(
                logoWithBleImg,
                height: 150,
              ))
        ],
      ),
    );
  }
}
