import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Princy4 extends StatefulWidget {
  const Princy4({super.key});

  @override
  State<Princy4> createState() => _Princy4State();
}

class _Princy4State extends State<Princy4> {
  Map catFact = {};

  getAllCatFact() async {
    var res = await http.get(Uri.parse("https://catfact.ninja/fact"));
    debugPrint("https://catfact.ninja/fact");
    var data = jsonDecode(res.body);
    catFact = data;
    debugPrint("------->$catFact");
    setState(() {});
  }

  @override
  void initState() {
    getAllCatFact();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catfacts", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blueGrey, border: Border.all(color: Colors.green)),
            child: Column(
              children: [
                Column(
                  children: [
                    const Text(
                      "Facts",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Text("${catFact["fact"]}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ],
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    const Text("Length",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text("${catFact["length"]}",
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              getAllCatFact();
              setState(() {

              });
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(90), color: Colors.blue, border: Border.all(color: Colors.black, width: 2)),
              child: const Icon(Icons.add),
            ),

          )
        ],
      ),

    );
  }
}