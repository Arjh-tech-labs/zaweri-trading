import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:Zaveri/screens/Auth/forget_password.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Zaveri/bottom_bar/bottom_bar.dart';

import '../../Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import '../../Custom_BlocObserver/button/custtom_button.dart';
import '../../Custom_BlocObserver/notifire_clor.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class veryfication extends StatefulWidget {
  const veryfication({Key? key}) : super(key: key);

  @override
  State<veryfication> createState() => _veryficationState();
}

class _veryficationState extends State<veryfication> {
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
    return ScreenUtilInit(
      builder:  (_,child) {
        return Scaffold(
          backgroundColor: notifier.getwihitecolor,
          appBar: CustomAppBar(
            notifier.getwihitecolor,
            "",
            notifier.getblck,
            height: height / 15,
          ),
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
                          "OTP Code Verification",
                          style: TextStyle(
                              color: notifier.getblck,
                              fontSize: 26.sp,
                              fontFamily: 'Gilroy_Bold'),
                        ),
                        SizedBox(height: height / 25),
                        Text(
                          "We have sent the OTP code via your \nmobile number Please enter the \ncolumn below",
                          style:
                          TextStyle(fontSize: 16.sp, color: notifier.getgrey),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height / 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    otpfild(),
                    otpfild(),
                    otpfild(),
                    otpfild(),
                  ],
                ),
                SizedBox(height: height / 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t received the code?",
                      style: TextStyle(
                          color: notifier.getgrey, fontSize: 13.sp),
                    ),
                    Text(
                      "Resend Code",
                      style: TextStyle(
                          color: notifier.getbluecolor, fontSize: 13.sp),
                    ),
                  ],
                ),
                SizedBox(height: height / 2.1),
                GestureDetector(
                    onTap: () {
                      Get.to(
                        ForgetPassword(),
                        // bottom_Home(),
                      );
                    },
                    child: button(
                        "Next", notifier.getbluecolor,
                        notifier.getwihitecolor))
              ],
            ),
          ),
        );
      }
    );
  }

  Widget otpfild() {
    return Container(
      height: height / 13,
      width: width / 6,
      decoration: BoxDecoration(
        border: Border.all(color: notifier.getbluecolor, width: 1.sp),
        borderRadius: BorderRadius.all(
          Radius.circular(15.sp),
        ),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25.sp),
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
