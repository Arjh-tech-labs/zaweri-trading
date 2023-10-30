import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../const/api_string.dart';
import '../controller/favoritecontroller.dart';
import 'package:http/http.dart'as http;

final WishlistsController wishlistsController = Get.find();
class SurajController extends GetxController{
  RxList suraj = [].obs;
  Future<void> callWatchlist() async {
    suraj.clear();
    List fetchWatchlistData = wishlistsController.wishlists;
    for (int i = 0; i < fetchWatchlistData.length; i++) {
      final stockToken = fetchWatchlistData[i]['stock_token'];
      final exchange = fetchWatchlistData[i]['market_type'];
      // print(stockToken);
      // print(exchange);

      final Uri url = Uri.parse(
          "https://apiconnect.angelbroking.com/rest/secure/angelbroking/market/v1/quote");

      final Map<String, String> headers = {
        'X-PrivateKey': 'mb76rTvg',
        'Accept': 'application/json',
        'X-SourceID': 'WEB',
        'X-ClientLocalIP': 'CLIENT_LOCAL_IP',
        'X-ClientPublicIP': 'CLIENT_PUBLIC_IP',
        'X-MACAddress': 'MAC_ADDRESS',
        'X-UserType': 'USER',
        'Authorization':
        '$angleOneToken',
        'Content-Type': 'application/json'
      };

      final Map<String, dynamic> data = {
        "mode": "FULL",
        "exchangeTokens": {
          "$exchange": [
            "$stockToken",
          ]
        }
      };

      final String jsonData = json.encode(data);

      try {
        final response = await http.post(url, headers: headers, body: jsonData);

        var data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          suraj.addAll(data['data']['fetched']);
        } else {
          print("Response data: ${response.body}");
        }
        // print(suraj);
      } catch (exception) {
        print("Error during authorized POST request: $exception");
      }

    }
    update();
    // print(suraj.length);
  }
}