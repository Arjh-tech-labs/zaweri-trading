import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../const/api_string.dart';

class OrderController extends GetxController{
  var orderList = [].obs;
  void orderApi()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userid = prefs.getInt('userid')!;
    String token = prefs.getString('barrierToken')!;
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var url = Uri.parse('$orderListUrl$userid');
    var response = await http.get(url, headers: headers);
    var data = json.decode(response.body);
    // print(data);
    if (response.statusCode == 200) {
      orderList.value = data['orders'];
      print(orderList);
      update();

    } else {
    }
  }
}