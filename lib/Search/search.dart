import 'package:flutter/material.dart';
import 'package:Zaveri/utils/medeiaqury/medeiaqury.dart';

class SearchPage extends StatefulWidget {
  // const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              // AppBar(
              //   elevation: 0,
              //   automaticallyImplyLeading: false,
              //   title:  TextFormField(
              //     decoration: const InputDecoration(
              //       labelText: 'Search Here',
              //       prefixIcon: Icon(
              //         Icons.search,
              //         color: Colors.black26,
              //       ),
              //     ),
              //     onChanged: (value) {
              //       setState(() {
              //         // fetchProduct(value);
              //       });
              //     },
              //   ),
              //   backgroundColor: Colors.lightBlue[50],
              // ),
          Row(
            children: [
              Container(
                width: 50,
                child: ImageIcon(
                  AssetImage('assets/images/back.png'), // Replace with your image path
                  size: 50.0, // Set the size of the icon
                  // Set the color of the icon
                ),
              ),
              // Expanded(child: Container()),
              Container(
              height: 45,
                width: 200,
                child: TextField(
                  style: TextStyle(color: Colors.grey),
                  onChanged: (value) {
                    print(value);
                  },
                  // obscureText: hidePassword, //show/hide password
                  decoration: InputDecoration(
                    label: Text("Search"),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.search),
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          )
            ],
          ),
        ),
      ),
    );
  }
}
