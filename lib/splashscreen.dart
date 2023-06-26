import 'dart:async';

import 'package:fininfocom/pages/dashboard.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboardscreen(),
            )));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: [
            SizedBox(
              height: 250,
            ),
            Center(
                child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        "https://bairesdev.mo.cloudinary.net/blog/2021/10/prototype-model.jpg"))),
          ],
        ));
  }
}
