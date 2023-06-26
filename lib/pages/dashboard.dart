import 'dart:io';

import 'package:fininfocom/pages/bluetooth.dart';
import 'package:fininfocom/pages/profilepage.dart';
import 'package:fininfocom/pages/randamimages.dart';
import 'package:fininfocom/widgets/button.dart';
import 'package:flutter/material.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            elevation: 2,
            backgroundColor: Colors.white,
            leading: const Icon(
              Icons.menu,
              color: Color(0xffFF6700),
            ),
            centerTitle: true,
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "FIN INFOCOM",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.only(right: 15, left: 15),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "images/finlogo.png",
                        scale: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  DashboardButton(
                    icon: Icons.animation_outlined,
                    defaulttext: "Random Dogs",
                    onClicked: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Randomimages()));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DashboardButton(
                    icon: Icons.bluetooth,
                    defaulttext: "Enable Bluetooth",
                    onClicked: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BluetoothOnpage()));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DashboardButton(
                    icon: Icons.person_2_outlined,
                    defaulttext: "Profile",
                    onClicked: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profilepage()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () => showExitPopup(context));
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Do you want to exit the app?",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            exit(0);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: const Text(
                            "Yes",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontFamily: 'Poppins-regular',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6700),
                        ),
                        child: const Text(
                          "No",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontFamily: 'Poppins-regular',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
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
