// import 'package:flutter/material.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:web_socket_channel/io.dart'; // Use `io` for mobile apps or `html` for web apps
//
// class SurajYadav extends StatefulWidget {
//   @override
//   _SurajYadavState createState() => _SurajYadavState();
// }
//
// class _SurajYadavState extends State<SurajYadav> {
//   final channel = WebSocketChannel.connect(
//     Uri.parse('wss://smartapisocket.angelone.in/smart-stream'),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('WebSocket Example'),
//         ),
//         body: StreamBuilder(
//           stream: channel.stream,
//           builder: (context, snapshot) {
//             return Center(
//               child: Text(snapshot.hasData ? 'Received: ${snapshot.data}' : 'Connecting...'),
//             );
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             channel.sink.add('Hello, WebSocket Server!');
//           },
//           child: Icon(Icons.send),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     channel.sink.close();
//     super.dispose();
//   }
// }
