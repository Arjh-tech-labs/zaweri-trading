// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart'as http;
// import 'package:get/get.dart';
//
// class StockController extends GetxController{
//   RxList fetchedStock = [].obs;
//
//   Timer? apiCallTimer; // Timer object to control the periodic API call
//
//   @override
//   void onInit() {
//     super.onInit();
//     // Start calling the API every second when the controller is initialized
//     startApiCallTimer();
//   }
//
//   void startApiCallTimer() {
//     // Create a new Timer that calls the API function every second
//     apiCallTimer = Timer.periodic(Duration(seconds: 1), (timer) {
//       postAuthorizedData();
//     });
//   }
//
//   @override
//   void onClose() {
//     // Cancel the timer when the controller is closed to prevent memory leaks
//     apiCallTimer?.cancel();
//     super.onClose();
//   }
//
//
//   void postAuthorizedData() async {
//     final Uri url = Uri.parse(
//         "https://apiconnect.angelbroking.com/rest/secure/angelbroking/market/v1/quote");
//
//     final Map<String, String> headers = {
//       'X-PrivateKey': 'mb76rTvg',
//       'Accept': 'application/json',
//       'X-SourceID': 'WEB',
//       // 'X-ClientLocalIP': 'CLIENT_LOCAL_IP',
//       // 'X-ClientPublicIP': 'CLIENT_PUBLIC_IP',
//       // 'X-MACAddress': 'MAC_ADDRESS',
//       'X-UserType': 'USER',
//       'Authorization': 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJ1c2VybmFtZSI6IkRJWUQzMTI1MCIsInJvbGVzIjowLCJ1c2VydHlwZSI6IlVTRVIiLCJ0b2tlbiI6ImV5SmhiR2NpT2lKSVV6VXhNaUlzSW5SNWNDSTZJa3BYVkNKOS5leUp6ZFdJaU9pSkVTVmxFTXpFeU5UQWlMQ0psZUhBaU9qRTJPVGd4TXprNU1ETXNJbWxoZENJNk1UWTVPREF6T1RVMU9Dd2lhblJwSWpvaU9XVmhOREZpTjJRdFpqSTFaaTAwWlRCbExUaGpPRFF0TURJek1Ua3lOVE5tWTJKbElpd2liMjF1WlcxaGJtRm5aWEpwWkNJNk15d2ljMjkxY21ObGFXUWlPaUl6SWl3aWRYTmxjbDkwZVhCbElqb2lZMnhwWlc1MElpd2lkRzlyWlc1ZmRIbHdaU0k2SW5SeVlXUmxYMkZqWTJWemMxOTBiMnRsYmlJc0ltZHRYMmxrSWpvekxDSnpiM1Z5WTJVaU9pSXpJbjAuNXhKYnN0Vjdja0ZJZWt1djlPT1ZIckRoR2hlelVVcjdXZFZ1eVUwRWVSY1pkQTk2cno2TEhLeVZwNmExdy1kN2VYTmlBM2k1WjdTUnlHaFEtbTducFEiLCJBUEktS0VZIjoibWI3NnJUdmciLCJpYXQiOjE2OTgwMzk2MTgsImV4cCI6MTY5ODEzOTkwM30.bOJCLJ2bVOFtUXhkHUbxVQgRRuFLopAJNqayUMhmINnKWOYVgKqE8w-ghGAKF56EkMoO9L4oMbgizyEEW0l8_w',
//       'Content-Type': 'application/json'
//     };
//
//     final Map<String, dynamic> data = {
//       "mode": "FULL",
//       "exchangeTokens": {
//         "BSE": [
//           "532454"
//         ]
//       }
//     };
//
//     final String jsonData = json.encode(data);
//
//     try {
//       final response = await http.post(url, headers: headers, body: jsonData);
//
//       var data = jsonDecode(response.body);
//       // print(data);
//       if (response.statusCode == 200) {
//         fetchedStock.value = data['data']['fetched'];
//         print(fetchedStock);
//         update();
//         // print("Response data: ${data}");
//         // print("Authorized POST request successful");
//       } else {
//         print(
//             "Authorized POST request failed with status: ${response.statusCode}");
//         print("Response data: ${response.body}");
//       }
//     } catch (exception) {
//       print("Error during authorized POST request: $exception");
//     }
//   }
// }