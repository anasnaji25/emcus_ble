import 'package:emcus_ble/src/const/app_colors.dart';
import 'package:emcus_ble/src/const/app_fonts.dart';
import 'package:emcus_ble/src/const/app_images.dart';
import 'package:emcus_ble/src/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: Container(
            height: 100,
            decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(drawerIcon),
                  Image.asset(logoImage2),
                  IconButton(
                      onPressed: () {
                        _logoutAlert();
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          )),
      body: Center(
        child: Text("Settings",style: primaryFont.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 35,
          color: Colors.white
        ),),
      )
    );
  }

  Future<void> _logoutAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log out'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text('Are you sure want to logout?')],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Get.find<AuthController>().logoutUser();
              },
            ),
          ],
        );
      },
    );
  }
}
