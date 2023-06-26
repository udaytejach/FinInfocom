import 'dart:io';

import 'package:fininfocom/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class BluetoothOnpage extends StatefulWidget {
  const BluetoothOnpage({super.key});

  @override
  State<BluetoothOnpage> createState() => _BluetoothOnpageState();
}

class _BluetoothOnpageState extends State<BluetoothOnpage> {
  BluetoothState? state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Bluetooth",
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const Dashboardscreen();
              }));
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                "For Testing, TURN OFF YOUR BLUETOOTH Then Click on TURN ON Button To Verify Functionality"),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color(0xffFF6700),
                    fixedSize: const Size(150, 48),
                    textStyle: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: 'Poppins-regular',
                      fontWeight: FontWeight.w700,
                    )),
                onPressed: Platform.isAndroid
                    ? () async {
                        if (!await Permission.bluetoothConnect.isGranted) {
                          await Permission.bluetoothConnect.request();
                        }
                        FlutterBluePlus.instance.turnOn();
                      }
                    : null,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.bluetooth,
                      size: 24,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "TURN ON",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color(0xffFF6700),
                    fixedSize: const Size(150, 48),
                    textStyle: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: 'Poppins-regular',
                      fontWeight: FontWeight.w700,
                    )),
                onPressed: Platform.isAndroid
                    ? () async {
                        if (!await Permission.bluetoothConnect.isGranted) {
                          await Permission.bluetoothConnect.request();
                        }
                        FlutterBluePlus.instance.turnOff();
                      }
                    : null,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(width: 4),
                    Icon(
                      Icons.bluetooth,
                      size: 24,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "TURN OFF",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 4),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
