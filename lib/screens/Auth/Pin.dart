import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Zaveri/Custom_BlocObserver/button/custtom_button.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/bottom_bar/bottom_bar.dart';
import '../../Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class Pin extends StatefulWidget {
  const Pin({Key? key}) : super(key: key);

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
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
                          "PIN Auth",
                          style: TextStyle(
                              color: notifier.getblck,
                              fontSize: 26.sp,
                              fontFamily: 'Gilroy_Bold'),
                        ),
                        SizedBox(height: height / 25),
                        Text(
                          "Enter your PIN number",
                          style:
                          TextStyle(fontSize: 16.sp, color: notifier.getgrey),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height / 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    otpfild(),
                    SizedBox(width: width / 25),
                    otpfild(),
                    SizedBox(width: width / 25),
                    otpfild(),
                    SizedBox(width: width / 25),
                    otpfild(),
                  ],
                ),
                SizedBox(height: height / 2.1),
                GestureDetector(
                    onTap: () {
                      Get.to(BottomNavBar());
                    },
                    child: button("Continue", notifier.getbluecolor,
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
      height: height / 30,
      width: width / 15,
      decoration: BoxDecoration(
        color: notifier.getpinauth,
        borderRadius: BorderRadius.all(
          Radius.circular(15.sp),
        ),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        cursorColor: Theme.of(context).primaryColor,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14.sp),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
