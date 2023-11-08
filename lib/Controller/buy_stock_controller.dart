import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../bottom_bar/bottom_bar.dart';
import '../bottom_bar/bottom_pages/stock_exchange_tabs/ModleView/buySellModle.dart';
import '../bottom_bar/controller/portfolio_controller.dart';
import '../const/api_string.dart';

class BuyStockController extends GetxController {

  final PortfolioController portfolioController = Get.find();
  void buyStockApi({
    required String stokeName,
    required String stokeExg,
    required String stokePrice,
    required String stokeToken,
    required String stokeQty,
    required BuildContext context,
    required String stokeType,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userid = prefs.getInt('userid')!;
    String token = prefs.getString('barrierToken')!;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var request = http.Request('POST', Uri.parse(buyStockListUrl));
    request.body = json.encode({
      "user_id": userid,
      "ordertype": "$stokeType",
      "stock_token": "$stokeToken",
      "stock_symbol": "$stokeName",
      "stop_loss": "",
      "producttype": "Holding",
      "duration": "DAY",
      "price": "$stokePrice",
      "quantity": "$stokeQty",
      "exchange": "$stokeExg"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String responseBody = await response.stream.bytesToString();
    final jsonResponse = json.decode(responseBody);
    if (response.statusCode == 200) {
      loading.value = false;
      portfolioController.portfolioApi();

      showDialog(
          context: context,
          builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('successful.'),
          actions: <Widget>[
            Center(
              child: TextButton(
                child: Text('OK'),
                onPressed: () {
                  // Navigator.of(context).pop();
                  Get.offAll(BottomNavBar());
                },
              ),
            ),
          ],
        );
      },
      );

    } else {
      loading.value = false;
      Fluttertoast.showToast(
        msg: jsonResponse['error'].toString(),
        backgroundColor: Colors.black,
      );
    }
  }
}
