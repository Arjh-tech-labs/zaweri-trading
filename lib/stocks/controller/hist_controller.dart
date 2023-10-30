import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';

import '../../const/api_string.dart';

class HistController extends GetxController{
  RxList fetchedHist = [].obs;
  void histData({String? exchange,String? token}) async {
    final Uri url = Uri.parse(
        "https://apiconnect.angelbroking.com/rest/secure/angelbroking/historical/v1/getCandleData");

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
      "exchange": exchange,
      "symboltoken": token,
      "interval": "ONE_DAY",
      "fromdate": "2023-10-24 09:30",
      "todate": "2023-10-25 09:31"
    };

    final String jsonData = json.encode(data);

    try {
      final response = await http.post(url, headers: headers, body: jsonData);

      var data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        fetchedHist.value = data['data'];
        update();
        // print(fetchedHist);
        // print("Response data: ${data}");
        // print("Authorized POST request successful");
      } else {
        print("Response data: ${response.body}");
      }
    } catch (exception) {
      print("Error during authorized POST request: $exception");
    }
  }
}