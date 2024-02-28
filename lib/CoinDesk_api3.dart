import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoinDesk extends StatefulWidget {
  const CoinDesk({super.key});

  @override
  State<CoinDesk> createState() => _CoinDeskState();
}

class _CoinDeskState extends State<CoinDesk> {
  Map coinDeskMap = {};

  getAllCoinMap() async {
    try {
      var res = await http.get(Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json"));

      debugPrint("https://api.coindesk.com/v1/bpi/currentprice.json");

      var data = jsonDecode(res.body);

      coinDeskMap = data;
      debugPrint("=======> $coinDeskMap");

      setState(() {});
    } catch (e) {
      debugPrint("Error = $e");
    }
  }

  @override
  void initState() {
    getAllCoinMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Coin Desk",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
                border: Border.all(width: 2, color: Colors.black),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      const Text(
                        "Coin Desk",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "updated: ${coinDeskMap["time"]["updated"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "updatedISO: ${coinDeskMap["time"]["updatedISO"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "updateduk: ${coinDeskMap["time"]["updateduk"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "disclaimer: ${coinDeskMap["disclaimer"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "chartName: ${coinDeskMap["chartName"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "BPI",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "chartName: ${coinDeskMap["bpi"]["USD"]["code"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "symbol: ${coinDeskMap["bpi"]["USD"]["symbol"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "rate: ${coinDeskMap["bpi"]["USD"]["rate"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "description: ${coinDeskMap["bpi"]["USD"]["description"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "rate_float: ${coinDeskMap["bpi"]["USD"]["rate_float"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "GBP",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "code: ${coinDeskMap["bpi"]["GBP"]["code"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "symbol: ${coinDeskMap["bpi"]["GBP"]["symbol"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "rate: ${coinDeskMap["bpi"]["GBP"]["rate"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "description: ${coinDeskMap["bpi"]["GBP"]["description"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "rate_float: ${coinDeskMap["bpi"]["GBP"]["rate_float"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "EUR",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "code: ${coinDeskMap["bpi"]["EUR"]["code"]}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "symbol: ${coinDeskMap["bpi"]["EUR"]["symbol"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "rate: ${coinDeskMap["bpi"]["EUR"]["rate"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "description: ${coinDeskMap["bpi"]["EUR"]["description"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "rate_float: ${coinDeskMap["bpi"]["EUR"]["rate_float"]}",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}