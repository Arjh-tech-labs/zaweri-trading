import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import '../../bottom_bar/controller/favoritecontroller.dart';
import '../controller/stock_search_controller.dart';


final WishlistsController wishlistsController = Get.find();
final StockSearchController stockSearchController = Get.find();
Future<void> AddFav(
    {String? stockToken, String? stockSymbol, String? marketType,String?filterName}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int userid = prefs.getInt('userid')!;
  String token = prefs.getString('barrierToken')!;

  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST', Uri.parse('https://zaveritrading.com/api/user/wishListAdd'));
  request.body = json.encode({
    "user_id": "$userid",
    "stock_token": "$stockToken",
    "stock_symbol": "$stockSymbol",
    "market_type": "$marketType"
  });
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  String responseBody = await response.stream.bytesToString();
  final jsonResponse = json.decode(responseBody);
  if (response.statusCode == 200) {
    stockSearchController.fetchFilteredStocks(filter: filterName);
    wishlistsController.favoriteApi();

    Fluttertoast.showToast(
      msg: jsonResponse['message'].toString(),
      backgroundColor: Colors.black,
    );
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}