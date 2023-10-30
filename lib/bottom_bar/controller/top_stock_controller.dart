import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/api_string.dart';

class TopStockController extends GetxController{
  var topStockList = [].obs;
  void callTopStockApi()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userid = prefs.getInt('userid')!;
    String token = prefs.getString('barrierToken')!;
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var url = Uri.parse('$topStockUrl');
    var response = await http.get(url, headers: headers);
    var data = json.decode(response.body);
    // print(data);
    if (response.statusCode == 200) {
      topStockList.value = data['stocks'];
      callPortfolio();
      update();
    } else {
    }
  }

  RxList fetchedTopStock = [].obs;
  Future<void> callPortfolio() async {
    fetchedTopStock.clear();
    for (int i = 0; i < topStockList.length; i++) {
      final stockToken = topStockList[i]['token'];
      final exchange = topStockList[i]['exch_seg'];
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
          fetchedTopStock.addAll(data['data']['fetched']);
        } else {
          print("Response data: ${response.body}");
        }
        // print(suraj);
      } catch (exception) {
        print("Error during authorized POST request: $exception");
      }

    }
    update();
  }

}