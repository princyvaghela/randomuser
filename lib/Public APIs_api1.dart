import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Princy2 extends StatefulWidget {
  const Princy2({super.key});

  @override
  State<Princy2> createState() => _Princy2State();
}

class _Princy2State extends State<Princy2> {
  List publicAllList = [];
  List categoryList = [];
  List animalList =[];


  // List userList=[];
  getAllRandom() async {
    var res = await http.get(Uri.parse("https://api.publicapis.org/entries"));
    // debugPrint("https://api.publicapis.org/entries");
    var data = jsonDecode(res.body);
    // debugPrint("statusCode= ${res.statusCode}");
    publicAllList.addAll(data["entries"]);

    for (var i = 0; i < publicAllList.length; i++) {
      if (categoryList.contains(publicAllList[i]["Category"])) {
        if (kDebugMode) {
          print("---->value already available");
        }
      } else {
        {
          if (kDebugMode) {
            print("------>value added");
          }
        }
        categoryList.add("${publicAllList[i]["Category"]}");
      }
    }
    for(int i = 0;i<publicAllList.length;i++){
      if((publicAllList[i]["Category"]) == "Anime"){
        animalList.add(publicAllList[i]);
      }
    }
    debugPrint('${animalList.length}');

    // debugPrint("$categoryList");

    setState(() {});
  }

  @override
  void initState() {
    getAllRandom();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("Public APLs", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),),
      ),
      body: ListView(
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
            itemCount: animalList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius:  BorderRadius.circular(15),
                ),

                child: Center(
                  child: Text("${animalList[index]["API"]}"),
                ),

              );
            },
          ),
        ],
      ),
    );
  }
}
