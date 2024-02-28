import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Genderize extends StatefulWidget {
  const Genderize({super.key});

  @override
  State<Genderize> createState() => _GenderizeState();
}

class _GenderizeState extends State<Genderize> {

  Map genderizeMap = {};

  getBoredData() async {
    try {
      var res = await http.get(Uri.parse("https://www.boredapi.com/api/activity"));
      var data = jsonDecode(res.body);
      genderizeMap = data;
      debugPrint("$genderizeMap");
      setState(() {});
    } catch (e) {
      debugPrint("-----Error----->$genderizeMap");
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Genderize",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),),),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 60),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      "count =86426",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),

                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "name =luc",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),

                ],
              ),
              Row(
                children: [
                  Text(
                    "gender =male",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),

                ],
              ),
              Row(
                children: [
                  Text(
                    "probability =0.99",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );

  }
}
