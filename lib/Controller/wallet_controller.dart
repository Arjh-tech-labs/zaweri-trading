import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WalletController extends GetxController{
  double price = 0;
  WalletAPI() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userid = prefs.getInt('userid')!;
    String token = prefs.getString('barrierToken')!;
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var url = Uri.parse('https://zaveritrading.com/api/user/fetchWallet/$userid');
    var response = await http.get(url, headers: headers);
    var data = json.decode(response.body);
    if (data["status"] == 1) {
      if (data["status"] == 1) {
        final wallet = data["wallet"];
        price = double.parse(wallet['balance'].toString());
        update();

      }
    }
  }
}