import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var ImgStatus = 0;
  RxMap fetchData =  {}.obs;
  UserUpdateAPI() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userid = prefs.getInt('userid')!;
    String token = prefs.getString('barrierToken')!;
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://zaveritrading.com/api/user/update/$userid'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    String responseBody = await response.stream.bytesToString();
    final jsonResponse = json.decode(responseBody);
    int status = jsonResponse['status'];
    if(status == 1){
      var data = jsonResponse['data'];
      fetchData.value = data;
      ImgStatus = 2;
      update();
    }else{
    }
  }


}
