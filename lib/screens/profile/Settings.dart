import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/pages.dart';
import 'package:Zaveri/screens/Auth/views/Login.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late ColorNotifier notifier;
  bool value = false;
  String?  appName = '';
  String? appVersion = '';

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifier.setIsDark = false;
    } else {
      notifier.setIsDark = previusstate;
    }
  }
  void clearSpecificSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userid');
  }

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
    versionInfo();
  }

  versionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    appName = packageInfo.appName;
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return ScreenUtilInit(
      builder: (_,child) {
        return Scaffold(
          backgroundColor: notifier.getwihitecolor,
          appBar: CustomAppBar(
              notifier.getwihitecolor, "Settings", notifier.getblck,
              height: height / 15),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height / 30),
                Row(
                  children: [
                    SizedBox(width: width / 20),
                    Text(
                      "General",
                      style: TextStyle(
                          color: notifier.getgrey,
                          fontFamily: 'Gilroy_Medium',
                          fontSize: 15.sp),
                    ),
                  ],
                ),
                SizedBox(height: height / 20),
                GestureDetector(
                    onTap: () {
                      Get.to(Pages("Notifications"));
                    },
                    child: setting_option("Notifications")),
                SizedBox(height: height / 20),
                GestureDetector(
                    onTap: () {
                      Get.to(Pages("Rate Zaveri Trading"));
                    },
                    child: setting_option("Rate Zaveri Trading")),
                SizedBox(height: height / 20),
                GestureDetector(
                    onTap: () {
                      Get.to(Pages("Contact Us"));
                    },
                    child: setting_option("Contact Us")),
                SizedBox(height: height / 18),
                // Row(
                //   children: [
                //     SizedBox(width: width / 20),
                //     Text(
                //       "Security",
                //       style: TextStyle(
                //           color: notifier.getgrey,
                //           fontFamily: 'Gilroy_Medium',
                //           fontSize: 15.sp),
                //     ),
                //   ],
                // ),
                // SizedBox(height: height / 23),
                // finger_print_and_face_id(),
                // SizedBox(height: height / 23),
                Dark_mode(),
                SizedBox(height: height / 20),
                // GestureDetector(
                //     onTap: () {
                //       Get.to(Pages("Privacy Policy"));
                //     },
                //     child: setting_polecy()),
                // SizedBox(height: height / 20),
                // GestureDetector(
                //     onTap: () {
                //       Get.to(Pages("Legal"));
                //     },
                //     child: setting_option("Legal")),
                // SizedBox(height: height / 25),
                GestureDetector(
                  onTap: () {
                    clearSpecificSharedPreferences();
                    Get.off(const Login());
                  },
                  child: Center(
                    child: Text(
                      "Log out",
                      style: TextStyle(
                          color: const Color(0xffFC6C6B),
                          fontSize: 16.sp,
                          fontFamily: 'Gilroy_Bold'),
                    ),
                  ),
                ),
                SizedBox(height: height / 80),
                Center(
                  child: Text(
                    "© 2022 $appName version $appVersion",
                    style: TextStyle(
                        color: notifier.getgrey,
                        fontSize: 14.sp,
                        fontFamily: 'Gilroy_Medium'),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget Dark_mode() {
    return Container(
      child: Row(
        children: [
          SizedBox(width: width / 13),
          Text(
            "Dark Mode",
            style: TextStyle(
                fontFamily: 'Gilroy_Medium',
                fontSize: 17.sp,
                color: notifier.getblck),
          ),
          const Spacer(),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: notifier.getbluecolor,
              value: notifier.getIsDark,
              onChanged: (val) async {
                final prefs = await SharedPreferences.getInstance();
                setState(() {
                  notifier.setIsDark = val;
                  prefs.setBool("setIsDark", val);
                });
              },
            ),
          ),
          SizedBox(width: width / 20),
        ],
      ),
    );
  }

  Widget finger_print_and_face_id() {
    return Container(
      child: Row(
        children: [
          SizedBox(width: width / 13),
          Text(
            "Fingerprint and Face ID",
            style: TextStyle(
                fontFamily: 'Gilroy_Medium',
                fontSize: 17.sp,
                color: notifier.getblck),
          ),
          const Spacer(),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: notifier.getbluecolor,
              value: value,
              onChanged: (v) {
                setState(() {
                  value = v;
                });
              },
            ),
          ),
          // FlutterSwitch(toggleSize: 15.sp,
          //     height: height / 38,inactiveColor: notifier.getbluecolor,
          //     width: width / 10,
          //     activeToggleColor: notifier.getwihitecolor,
          //     activeColor: notifier.getbluecolor,
          //     value: value,
          //     onToggle: (v) {
          //       value = v;
          //     }),
          SizedBox(width: width / 20),
        ],
      ),
    );
  }

  Widget setting_option(name) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          SizedBox(width: width / 13),
          Text(
            name,
            style: TextStyle(
                fontFamily: 'Gilroy_Medium',
                fontSize: 17.sp,
                color: notifier.getblck),
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios, color: notifier.getgrey, size: 17.sp),
          SizedBox(width: width / 20),
        ],
      ),
    );
  }

  Widget setting_polecy() {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          SizedBox(width: width / 13),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Privacy Policy",
                style: TextStyle(
                    fontFamily: 'Gilroy_Medium',
                    fontSize: 17.sp,
                    color: notifier.getblck),
              ),
              Text(
                "Choose what data you share with us",
                style: TextStyle(
                    fontFamily: 'Gilroy_Medium',
                    fontSize: 13.sp,
                    color: notifier.getgrey),
              ),
            ],
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios, color: notifier.getgrey, size: 17.sp),
          SizedBox(width: width / 20),
        ],
      ),
    );
  }
}
