import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart' as dioFormData;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/screens/Auth/views/Sign%20Up.dart';
import 'package:Zaveri/screens/reset_password/phone_num_reset_password.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import '../../../Custom_BlocObserver/button/custtom_button.dart';
import '../../../bottom_bar/bottom_bar.dart';
import '../../../const/api_string.dart';
import '../../../utils/medeiaqury/medeiaqury.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool hidePassword = true;
  bool loading = false;

  // late SharedPreferences prefs;

  late ColorNotifier notifier;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifier.setIsDark = false;
    } else {
      notifier.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

  // SharePref() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(builder: (_, child) {
      return Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: CustomAppBar(notifier.getwihitecolor, "", notifier.getblck,
            height: height / 15),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: width / 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back!",
                        style: TextStyle(
                            color: notifier.getblck,
                            fontSize: 26.sp,
                            fontFamily: 'Gilroy_Bold'),
                      ),
                      SizedBox(height: height / 25),
                      Text(
                        // "Enter your email address and password to\nlogin",
                        "Please sign in to continue",
                        style:
                            TextStyle(fontSize: 16.sp, color: notifier.getgrey),
                      ),
                      SizedBox(height: height / 30),
                      Container(
                        height: 45.h,
                        width: 300.w,
                        child: TextField(
                          controller: emailController,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            print(value);
                          },
                          // obscureText: hidePassword, //show/hide password
                          decoration: InputDecoration(
                            label: Text("Email Address"),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                            prefixIcon: Icon(Icons.mail, color: Colors.blue),
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height / 30),
                      Container(
                        height: 45.h,
                        width: 300.w,
                        child: TextField(
                          controller: passController,
                          style: TextStyle(color: Colors.black),
                          onChanged: (value) {
                            print(value);
                          },
                          obscureText: hidePassword,
                          //show/hide password
                          decoration: InputDecoration(
                            label: Text("Password"),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                            prefixIcon: Icon(Icons.lock, color: Colors.blue),
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height / 30),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        const phone_num_reset_password(),
                      );
                    },
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: notifier.getbluecolor,
                          fontSize: 13.5.sp,
                          fontFamily: 'Gilroy_Medium'),
                    ),
                  ),
                  SizedBox(width: width / 10),
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (emailController.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'Email address is required',
                      backgroundColor: Colors.black,
                    );
                  } else if (passController.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'Password is required',
                      backgroundColor: Colors.black,
                    );
                  } else {
                    LoginAPI(emailController, passController);
                    setState(() {
                      show();
                      loading = true;
                    });
                  }
                },
                child: loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : button("Login", notifier.getbluecolor,
                        notifier.getwihitecolor),
              ),
              SizedBox(height: height / 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: TextStyle(
                        color: notifier.getgrey,
                        fontSize: 15.sp,
                        fontFamily: 'Gilroy_Medium'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(SignUp());
                    },
                    child: Text(
                      " Sign Up",
                      style: TextStyle(
                          color: notifier.getbluecolor,
                          fontSize: 15.sp,
                          fontFamily: 'Gilroy_Bold'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  show() {
    CircularProgressIndicator(
      color: Colors.black,
    );
  }

  LoginAPI(TextEditingController emailController,
      TextEditingController passController) async {
    try {
      var dio = Dio();
      dioFormData.FormData formData = dioFormData.FormData.fromMap(
          {'email': emailController.text, 'password': passController.text});

      var response = await dio.request(
        loginUrl,
        options: Options(
          method: 'POST',
        ),
        data: formData,
      );
      String responseString = jsonEncode(response.data);
      Map<String, dynamic> jsonResponse = json.decode(responseString);
      int status = jsonResponse['status'];

      if (status == 1) {
        loading = false;
        Fluttertoast.showToast(
          msg: 'Login Successfully',
          backgroundColor: Colors.black,
        );
        Map<String, dynamic> data = jsonResponse['data'];
        int userid = data['id'];
        String accessToken = data['access_token'];

        final prefs = await SharedPreferences.getInstance();
        prefs.setInt('userid', userid);
        prefs.setString('barrierToken', accessToken);
        print(userid);
        Get.offAll(BottomNavBar());
        setState(() {});
      } else {
        Fluttertoast.showToast(
          msg: 'Error Found !',
          backgroundColor: Colors.black,
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
