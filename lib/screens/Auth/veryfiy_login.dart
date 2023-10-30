import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/screens/Auth/face_id.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class veryfiylogin extends StatefulWidget {
  const veryfiylogin({Key? key}) : super(key: key);

  @override
  State<veryfiylogin> createState() => _veryfiyloginState();
}

class _veryfiyloginState extends State<veryfiylogin> {
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
          appBar: CustomAppBar(notifier.getwihitecolor, "", notifier.getblck,
              height: height / 15),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: width / 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Verify Login",
                          style: TextStyle(
                              color: notifier.getblck,
                              fontSize: 26.sp,
                              fontFamily: 'Gilroy_Bold'),
                        ),
                        SizedBox(height: height / 25),
                        Text(
                          "Enter OTP Code send to +1 8943583***\nThis code will expired in 01:30",
                          style:
                          TextStyle(fontSize: 16.sp, color: notifier.getgrey),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height / 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    otpfild(),
                    otpfild(),
                    otpfild(),
                    otpfild(),
                  ],
                ),
                SizedBox(height: height / 21),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t received the code?",
                      style: TextStyle(
                          color: notifier.getgrey,
                          fontSize: 12.sp,
                          fontFamily: 'Gilroy_Medium'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const faceid(),
                          ),
                        );
                      },
                      child: Text(
                        "Resend Code",
                        style: TextStyle(
                            color: notifier.getbluecolor,
                            fontSize: 12.sp,
                            fontFamily: 'Gilroy_Medium'),
                      ),
                    )
                  ],
                )
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
