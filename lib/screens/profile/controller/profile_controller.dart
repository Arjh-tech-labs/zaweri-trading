import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  RxBool loading = true.obs;
  RxMap profileDetails = {}.obs;

  void postData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userid = prefs.getInt('userid')!;
    String token = prefs.getString('barrierToken')!;
    print(token);
    final Uri url = Uri.parse('https://zaveritrading.com/api/user/update/213'); // Replace with your server URL

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    final Map<String, dynamic> data = {
    };

    final String jsonData = json.encode(data);

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonData,
      );

      if (response.statusCode == 200) {
        print("Post request successful");
        print("Response data: ${response.body}");
      } else {
        print("Post request failed with status: ${response.statusCode}");
        print("Response data: ${response.body}");
      }
    } catch (exception) {
      print("Error during POST request: $exception");
    }
  }


}
