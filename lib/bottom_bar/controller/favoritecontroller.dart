import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/api_string.dart';
import '../models/WishlistModel.dart';

final SurajController surajController = Get.find();

class WishlistsController extends GetxController {
  var wishlists = [].obs;

  void favoriteApi()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userid = prefs.getInt('userid')!;
    String token = prefs.getString('barrierToken')!;
    print(token);
    var headers = {
      // 'accept': 'application/json',
      // 'Api-Version': '2.0',
      'Authorization': "Bearer $token",
      // 'Content-Type': 'application/x-www-form-urlencoded',
      // 'grant_type': 'USER',
      // 'client_secret': '2599b461-45b8-48f1-b1bc-a9fab8cd5fc5'
    };
    var url = Uri.parse('$wishListUrl$userid');
    var response = await http.get(url, headers: headers);
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      wishlists.value = data['wislists'];
      // print(wishlists);
      surajController.callWatchlist();
      update();
    } else {
    }
  }
}