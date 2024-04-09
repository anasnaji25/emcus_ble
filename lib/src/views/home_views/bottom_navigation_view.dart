import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:emcus_ble/src/const/app_colors.dart';
import 'package:emcus_ble/src/const/app_images.dart';
import 'package:emcus_ble/src/views/home_views/duagnostics_view.dart';
import 'package:emcus_ble/src/views/home_views/home_screen_view.dart';
import 'package:emcus_ble/src/views/home_views/maintenance_view.dart';
import 'package:emcus_ble/src/views/home_views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBarView> {
  int _bottomIndex = 0;
  List iconList = [dashIcon, maintainanceIcon, diagonsticIcon, settingsIcon];
  List screen = [
    HomeView(),
    MaintenanceView(),
    DiagnosticsView(),
    SettingsView()
  ];

  List tabNames = ["Dashboard", "Maintenance", "Diagnostics", "Settings"];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showExitPopup(context);
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        body: screen[_bottomIndex],
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            height: 65,
            backgroundColor: secondaryColor,
            itemCount: iconList.length,
            tabBuilder: (int index, bool isActive) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          child: SvgPicture.asset(
                            iconList[index],
                            color: isActive ? Colors.white : Colors.white70,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          tabNames[index],
                          style: primaryfont.copyWith(
                            fontSize: 11,
                            color: isActive ? Colors.white : Colors.white70,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
            activeIndex: _bottomIndex,
            leftCornerRadius: 23,
            rightCornerRadius: 23,
            gapLocation: GapLocation.none,
            onTap: (index) {
              setState(() {
                _bottomIndex = index;
              });
            }),
      ),
    );
  }

  var primaryfont = TextStyle();

  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Do you want to exit ?"),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            print('yes selected');
                            exit(0);
                          },
                          style: ElevatedButton.styleFrom(
                            textStyle:
                                primaryfont.copyWith(color: Colors.white),
                          ),
                          child: Text(
                            "Yes",
                            style: primaryfont.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          print('no selected');
                          Navigator.of(context).pop();
                        },
                        child:
                            Text("No", style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(),
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
