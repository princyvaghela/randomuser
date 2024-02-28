import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Princy extends StatefulWidget {
  const Princy({super.key});

  @override
  State<Princy> createState() => _PrincyState();
}

class _PrincyState extends State<Princy> {
  List randomuserList = [];

  getAllRandom() async {
    try {
      var res = await http.get(Uri.parse("https://randomuser.me/api/?results=2"));
      debugPrint("https://randomuser.me/api/?results=2");
      var data = jsonDecode(res.body);
      debugPrint("statusCode= ${res.statusCode}");
      randomuserList.addAll(data["results"]);
      // debugPrint("$randomuserList");
      setState(() {

      });
    } catch(e){
      debugPrint("Error = $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Randomuser", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),),
      ),
      body: ListView(
        children: [

          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: randomuserList.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration:
                        BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black, width: 1)),
                    child: CachedNetworkImage(
                      imageUrl: "${randomuserList[index]['picture']['large']}",
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () async {
          await getAllRandom();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
