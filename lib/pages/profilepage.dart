import 'dart:io';

import 'package:fininfocom/pages/dashboard.dart';
import 'package:fininfocom/models/profilemodel.dart';
import 'package:fininfocom/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Profilepage extends StatelessWidget {
  // const Profilepage({super.key});

  String name = "";
  String dob = "";

  String registered = "";

  void initState() {
    getoprodlist();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Profile",
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
        body: FutureBuilder<Getprofiledetails>(
            future: getoprodlist(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            'No Data found',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Popins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          RefreshButton(
                            defaulttext: "Refresh",
                            onClicked: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return Profilepage();
                              }));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasData) {
                name =
                    "${snapshot.data!.results[0].name.first} ${snapshot.data!.results[0].name.last}";
                dob = DateFormat('dd-MM-yyyy').format(DateTime.parse(
                    snapshot.data!.results[0].dob.date.toString()));
                registered = DateFormat('dd-MM-yyyy').format(DateTime.parse(
                    snapshot.data!.results[0].registered.date.toString()));

                return Column(
                  children: [
                    Stack(clipBehavior: Clip.none, children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(150),
                                bottomLeft: Radius.circular(150)),
                            color: Colors.blue.shade500),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: 80,
                          left: MediaQuery.of(context).size.width / 2,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                snapshot.data!.results[0].picture.large),
                          ))
                    ]),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 450,
                      width: double.infinity,
                      margin: const EdgeInsets.only(right: 15, left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Text(
                                "Date Of Birth / Age",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.shade50),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Text(
                                "$dob / ${snapshot.data!.results[0].dob.age} Years",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Text(
                                "Email",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.shade50),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Text(
                                snapshot.data!.results[0].email,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Text(
                                "Since Registered",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.shade50),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Text(
                                "$registered / ${snapshot.data!.results[0].registered.age} Years",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Location :",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xff303135),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  PaddingTextfour(
                                      text:
                                          "${snapshot.data!.results[0].location.street.number} ${snapshot.data!.results[0].location.street.name}"),
                                  PaddingTextfour(
                                      text: snapshot
                                          .data!.results[0].location.city
                                          .toString()),
                                  PaddingTextfour(
                                      text: snapshot
                                          .data!.results[0].location.state
                                          .toString()),
                                  PaddingTextfour(
                                      text: snapshot
                                          .data!.results[0].location.postcode
                                          .toString())
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RefreshButton(
                                defaulttext: "Refresh",
                                onClicked: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return Profilepage();
                                  }));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return Container();
            }),
      ),
      onWillPop: () => showExitPopup(context),
    );
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

  Future<Getprofiledetails> getoprodlist() async {
    String url = "https://randomuser.me/api/";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return getprofiledetailsFromJson(response.body);
    }

    {
      throw Exception('Failed to load post');
    }
  }
}
