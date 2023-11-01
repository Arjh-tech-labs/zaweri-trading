import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';

import '../../const/api_string.dart';

class StockController extends GetxController{
  RxList fetchedStock = [].obs;

  Timer? apiTimer; // Timer for periodic API requests

  void calEverySec({String? exchange,String? token}) {
    // Start a periodic timer to make API requests every second
    apiTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      stockData(exchange: exchange, token: token);
    });
  }

  void stockData({String? exchange,String? token}) async {
    final Uri url = Uri.parse(
        "https://apiconnect.angelbroking.com/rest/secure/angelbroking/market/v1/quote/");

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
          "$token",
        ]
      }
    };

    final String jsonData = json.encode(data);

    try {
      final response = await http.post(url, headers: headers, body: jsonData);

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        fetchedStock.value = data['data']['fetched'];
        update();
        // print(fetchedStock);
        // print("Response data: ${data}");
        // print("Authorized POST request successful");
      } else {
        print(
            "Authorized POST request failed with status: ${response.statusCode}");
        print("Response data: ${response.body}");
      }
    } catch (exception) {
      print("Error during authorized POST request: $exception");
    }
  }
  @override
  void onClose() {
    super.onClose();
    // Cancel the timer when the controller is disposed to avoid memory leaks
    apiTimer?.cancel();
    // Clear the list when navigating back
    fetchedStock.clear();
  }
}