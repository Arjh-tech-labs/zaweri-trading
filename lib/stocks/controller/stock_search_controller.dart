import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/api_string.dart';

class StockSearchController extends GetxController {
  RxList fetchedStock = [].obs;

  Future<void> fetchFilteredStocks({String? filter}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userid = prefs.getInt('userid')!;
    String token = prefs.getString('barrierToken')!;

    final response = await http.post(
      Uri.parse(searchStockUrl), // Replace with your API endpoint
      body: {'search': filter,'user_id': "$userid"}, // Send your filter criteria in the request body
    );

    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      fetchedStock.value = data['data'];
      print(fetchedStock);
      update();
    } else {
      throw Exception('Failed to load filtered stocks');
    }
  }
}
