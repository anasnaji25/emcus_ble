import 'package:emcus_ble/src/const/app_colors.dart';
import 'package:emcus_ble/src/const/app_fonts.dart';
import 'package:emcus_ble/src/const/app_images.dart';
import 'package:emcus_ble/src/controllers/auth_controller.dart';
import 'package:emcus_ble/src/widgets/custom_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              boxShadow: const [BoxShadow(blurRadius: 3, color: Colors.white)],
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1E1745),
                    Color.fromARGB(255, 67, 208, 142),
                  ]),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              setHeight(20),
              //Image.asset(scannerImage), // this image is not good (could't able to download from XD),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Signal strength".toUpperCase(),
                    style: primaryFont.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "95%".toUpperCase(),
                    style: primaryFont.copyWith(
                        color: Colors.white,
                        fontSize: 65,
                        fontWeight: FontWeight.bold),
                  ),
                  setHeight(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 65,
                        decoration: BoxDecoration(
                            color: const Color(0xff19191966),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              Text(
                                "GOOD",
                                style: primaryFont.copyWith(
                                    color: const Color(0xff88B51F),
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.check_circle,
                                color: Color(0xff88B51F),
                                size: 25,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Image.asset(
                  homeScreenImg3,
                  width: size.width,
                  fit: BoxFit.fitWidth,
                ),
              )
            ],
          ),
        ),
      ),
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
