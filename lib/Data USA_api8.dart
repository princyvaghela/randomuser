import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  List dataUsaList = [];

  getAllData() async {
    try {
      var res = await http.get(Uri.parse(
          "https://datausa.io/api/data?drilldowns=Nation&measures=Population"));
      var data = jsonDecode(res.body);
      dataUsaList = data["data"];
      debugPrint("$dataUsaList");
      setState(() {});
    } catch (e) {
      debugPrint("Error=$e");
    }
  }

  @override
  void initState() {
    getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(
        "DataUSA",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
      ),),
      body: ListView(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5, crossAxisSpacing: 5, crossAxisCount: 3),
            shrinkWrap: true,
            itemCount: dataUsaList.length,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal),
                child: Column(
                  children: [
                    Text(
                      "${dataUsaList[index]["ID Nation"]}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${dataUsaList[index]["Nation"]}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${dataUsaList[index]["ID Year"]}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${dataUsaList[index]["Year"]}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${dataUsaList[index]["Population"]}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${dataUsaList[index]["Slug Nation"]}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    // Text("${dataUsaList.length}")
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}