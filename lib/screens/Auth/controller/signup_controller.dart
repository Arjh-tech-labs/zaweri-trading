import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/src/form_data.dart' as dioFormData;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../bottom_bar/bottom_bar.dart';
import '../../../const/api_string.dart';

class SignUpApiController extends GetxController {
  RxBool loading = false.obs;
  void signUpApi({
    required String name,
    required String email,
    required String phone,
    required String pass,
  }) async {
    var dio = Dio();
    dioFormData.FormData formData = dioFormData.FormData.fromMap(
        {'name': name, 'email': email, 'phone': phone, 'password': pass});

    var response = await dio.request(
      signUpUrl,
      options: Options(
        method: 'POST',
      ),
      data: formData,
    );

    var responseString = jsonEncode(response.data);
    Map<String, dynamic> jsonResponse = json.decode(responseString);
    if (response.statusCode == 200) {
      loading.value = false;
      int status = jsonResponse['status'];
      if (status == 1) {
        Fluttertoast.showToast(
          msg: 'Registration Successfully',
          backgroundColor: Colors.black,
        );
        Map<String, dynamic> data = jsonResponse['data'];
        int userid = data['id'];
        String accessToken = data['access_token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // Set multiple key-value pairs
        await prefs.setInt('userid', userid);
        await prefs.setString('access_token', accessToken);
        Get.offAll(BottomNavBar());
        update();
      } else {
        Fluttertoast.showToast(
          msg: jsonResponse['error'].toString(),
          backgroundColor: Colors.black,
        );
        loading.value = false;
        update();
      }
    } else {
      loading.value = false;
      update();
      print(response.statusMessage);
    }
  }
}
