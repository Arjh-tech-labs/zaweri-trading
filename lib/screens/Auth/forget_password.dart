import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:Zaveri/screens/Auth/views/Login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import '../../Custom_BlocObserver/button/custtom_button.dart';
import '../../Custom_BlocObserver/custtom_textfild/custtompassword.dart';
import '../../Custom_BlocObserver/notifire_clor.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  TextEditingController newpassController = TextEditingController();
  TextEditingController passController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return  ScreenUtilInit(
        builder:  (_,child) {
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
                            "New Password",
                            style: TextStyle(
                                color: notifier.getblck,
                                fontSize: 26.sp,
                                fontFamily: 'Gilroy_Bold'),
                          ),
                          // SizedBox(height: height / 25),
                          // Text(
                          //   // "Enter your email address and password to\nlogin",
                          //   "Please sign in to continue",
                          //   style:
                          //   TextStyle(fontSize: 16.sp, color: notifier.getgrey),
                          // ),
                          SizedBox(height: height / 30),
                          Custompasswordtextfild.textField(
                              "New password",
                              notifier.getbluecolor,
                              Icons.lock,
                              notifier.getgrey,
                              notifier.getprefixicon,
                              notifier.getblck
                          ),
                          SizedBox(height: height / 30),
                          Custompasswordtextfild.textField(
                              "Confirm new password",
                              notifier.getbluecolor,
                              Icons.lock,
                              notifier.getgrey,
                              notifier.getprefixicon,
                              notifier.getblck),
                          SizedBox(height: height / 30),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: height / 2.7),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    child: button(
                        "Save", notifier.getbluecolor, notifier.getwihitecolor),
                  ),
                  SizedBox(height: height / 50),

                ],
              ),
            ),
          );
        }
    );
  }
}
