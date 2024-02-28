import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Agify extends StatefulWidget {
  const Agify({super.key});

  @override
  State<Agify> createState() => _AgifyState();
}

class _AgifyState extends State<Agify> {
  Map agifyMap = {};

  getBoredData() async {
    try {
      var res = await http.get(Uri.parse("https://www.boredapi.com/api/activity"));
      var data = jsonDecode(res.body);
      agifyMap = data;
      debugPrint("$agifyMap");
      setState(() {});
    } catch (e) {
      debugPrint("-----Error----->$agifyMap");
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:const Text("Agify.io", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),),),
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
                      "count = 21",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),

                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "name = meelad,",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),

                ],
              ),
              Row(
                children: [
                  Text(
                    "age = 33",
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
