import 'dart:convert';

import 'package:fininfocom/models/randomImagemodel.dart';
import 'package:fininfocom/pages/dashboard.dart';
import 'package:fininfocom/widgets/button.dart';
import 'package:fininfocom/widgets/progressbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Randomimages extends StatefulWidget {
  const Randomimages({super.key});

  @override
  State<Randomimages> createState() => _RandomimagesState();
}

class _RandomimagesState extends State<Randomimages> {
  String imageUrl =
      'https://bairesdev.mo.cloudinary.net/blog/2021/10/prototype-model.jpg';
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isApiCallProcess = true;
    });
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      child: uiSetup(context),
    );
  }

  Widget uiSetup(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Random Images",
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
      body: Container(
        margin: const EdgeInsets.only(right: 15, left: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            RefreshButton(
              defaulttext: "Refresh",
              onClicked: () {
                setState(() {
                  isApiCallProcess = true;
                });
                fetchData();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<RandomImages> fetchData() async {
    final url = Uri.parse('https://dog.ceo/api/breeds/image/random');
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonResponse = randomImagesFromJson(response.body);
      final imageUrlFromApi = jsonResponse.message.toString();

      print(imageUrlFromApi);

      setState(() {
        imageUrl = imageUrlFromApi;
        isApiCallProcess = false;
      });
      setState(() {
        isApiCallProcess = false;
      });
      return randomImagesFromJson(response.body);
    } else {
      setState(() {
        isApiCallProcess = false;
      });
      print('Request failed with status: ${response.statusCode}');
    }
    setState(() {
      isApiCallProcess = false;
    });
    return randomImagesFromJson("expection");
  }
}
