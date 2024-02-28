import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UniversitiesList extends StatefulWidget {
  const UniversitiesList({super.key});

  @override
  State<UniversitiesList> createState() => _UniversitiesListState();
}

class _UniversitiesListState extends State<UniversitiesList> {
  List universitiesList = [];

  getAllUniversitiesList() async {
    try {
      var res = await http.get(Uri.parse("http://universities.hipolabs.com/search?country=United+States&limit=20"));

      debugPrint("http://universities.hipolabs.com/search?country=United+States&limit=20");

      var data = jsonDecode(res.body);

      universitiesList = data;
      debugPrint("=======> $universitiesList");

      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getAllUniversitiesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Universities",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: universitiesList.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

                    mainAxisExtent: 250,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemBuilder: (ctx, index) {
                  return Center(
                    child: Container(
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.cyan,
                        border: Border.all(width: 2, color: Colors.black),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "${universitiesList[index]["name"]}",
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${universitiesList[index]["country"]}",
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${universitiesList[index]["state-province"]}",
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${universitiesList[index]["alpha_two_code"]}",
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: universitiesList[index]["web_pages"].length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, i) {
                              return Container(
                                height: 50,
                                color: Colors.yellow,
                                child: Text(
                                  "${universitiesList[index]["web_pages"][i]}",
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                              );
                            },
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: universitiesList[index]["domains"].length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, ind) {
                              return Text(
                                "${universitiesList[index]["domains"][ind]}",
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}