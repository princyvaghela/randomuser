import 'package:flutter/material.dart';
import 'package:randomuser/Randomuser_api13.dart';
import 'package:randomuser/reqres1.dart';

import 'Bored_api4.dart';
import 'Data USA_api8.dart';
import 'Dogs_api9.dart';
import 'Genderize.io_api6.dart';
import 'IPify_api10.dart';
import 'Jokes_api12.dart';
import 'Nationalize.io_api7.dart';
import 'Universities List_api14.dart';
import 'Public APIs_api1.dart';
import 'Hippopotamus_api15.dart';
import 'CoinDesk_api3.dart';
import 'Zippopotam_api15.dart';
import 'catfacts_api2.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner: false,
      home: const Princy4(),
    );
  }
}
