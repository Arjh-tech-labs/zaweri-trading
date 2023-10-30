import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Zaveri/Custom_BlocObserver/button/custtom_button.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/screens/Auth/views/Sign%20Up.dart';

import '../../utils/medeiaqury/medeiaqury.dart';
import '../Auth/views/Login.dart';

class OnBodingTwo extends StatefulWidget {
  const OnBodingTwo({Key? key}) : super(key: key);

  @override
  State<OnBodingTwo> createState() => _OnBodingTwoState();
}

class _OnBodingTwoState extends State<OnBodingTwo> {
  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

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
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(builder: (_, child) {
      return Scaffold(
        backgroundColor: notifier.getwihitecolor,
        body: Column(
          children: [
            SizedBox(height: height / 6),
            Image.asset(
              "assets/images/getStarted.png",
              width: width * 0.9,
            ),
            SizedBox(height: height / 11),
            Text(
              "Get started",
              style: TextStyle(
                  color: notifier.getblck,
                  fontSize: 26.sp,
                  fontFamily: 'Gilroy_Bold'),
            ),
            SizedBox(height: height / 50),
            Text(
              "You don’t have to pay a single rupee for\nopening a stocks account\nor account maintenance.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: notifier.getgrey,
                  fontSize: 13.sp,
                  fontFamily: 'Gilroy_Bold'),
            ),
            SizedBox(height: height / 12),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ),
                );
              },
              child: button("Create account", notifier.getbluecolor,
                  notifier.getwihitecolor),
            ),
            GestureDetector(
                onTap: () {
                  Get.offAll(Login());
                },
                child: button(
                    "Login", notifier.getwihitecolor, notifier.getbluecolor)),
          ],
        ),
      );
    });
  }
}
