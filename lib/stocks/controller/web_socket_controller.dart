// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
//
// class WebSocketController extends GetxController {
//   final channel = WebSocketChannel.connect(
//     Uri.parse('wss://smartapisocket.angelone.in/smart-stream'),
//     // headers: {
//     //   'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
//     //   // Add any other headers as needed
//     // },
//   );
//
//   Future<void> sendRequest() async {
//     final requestContract = {
//       "correlationID": "abcde12345",
//       "action": 1,
//       "params": {
//         "mode": 1,
//         "tokenList": [
//           {
//             "exchangeType": 1,
//             "tokens": ["10626", "5290"],
//           },
//           {
//             "exchangeType": 5,
//             "tokens": ["234230", "234235", "234219"],
//           },
//         ],
//       },
//     };
//
//     // Send the JSON request
//     channel.sink.add(json.encode(requestContract));
//
//     // Handle responses or incoming data as needed
//     channel.stream.listen((data) {
//       // Handle the received data here
//       print("Received data: $data");
//     });
//   }
//
//   @override
//   void onClose() {
//     channel.sink.close();
//     super.onClose();
//   }
// }
