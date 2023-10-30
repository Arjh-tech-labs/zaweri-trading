import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';

import '../../const/api_string.dart';

class StockSearchController extends GetxController{
  RxList fetchedStock = [].obs;

  Future<void> fetchFilteredStocks({String? filter}) async {
    final response = await http.post(
      Uri.parse(searchStockUrl), // Replace with your API endpoint
      body: {'search': filter}, // Send your filter criteria in the request body
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