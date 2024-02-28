import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class princy1 extends StatefulWidget {
  const princy1({super.key});

  @override
  State<princy1> createState() => _princy1State();
}

class _princy1State extends State<princy1> {
  List reqresList = [];
  String isselect = "0";

  getAllreqres() async {
    try {
      var res = await get(Uri.parse("https://reqres.in/api/usersF?per_page=10"));
      // debugPrint("https://reqres.in/api/usersF?per_page=10");
      var data = jsonDecode(res.body);
      setState(() {
      });
      // debugPrint("statusCode= ${res.statusCode}");
      reqresList = data["data"];
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getAllreqres();
    // TODO: implement initState
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
            itemCount: 10,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  isselect = index.toString();
                  print("$isselect");
                  setState(() {});
                },
                child:
                Container(
                  height: 150,
                  width: 150,
                  decoration:
                  BoxDecoration(color: Color(int.parse(reqresList[index]['color'].toString().replaceAll('#',"0xff"))),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 5)),
                  child: Center(child: Text("${reqresList[index]["name"]}",
                  ),
                  ),
                ),

              );
            }
          ),

        ],
      ),
    );
  }
}
