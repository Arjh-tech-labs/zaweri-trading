import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Custom_BlocObserver/colors.dart';
import '../../Custom_BlocObserver/colors.dart';
import '../../Custom_BlocObserver/notifire_clor.dart';
import '../../Custom_BlocObserver/swiper/swiper.dart';
import '../../bottom_bar/bottom_bar.dart';
import '../../utils/medeiaqury/medeiaqury.dart';
import '../page_view/onbonding_two.dart';

class Spash_Screen extends StatefulWidget {
  @override
  State<Spash_Screen> createState() => _Spash_ScreenState();
}

class _Spash_ScreenState extends State<Spash_Screen> {
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
    getPreference();
  }

  Future<String?> getPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userid = prefs.getInt('userid');
    // String token = prefs.getString('barrierToken')!;
    print(userid);
    if (userid == null) {
      Timer(const Duration(seconds: 2), () => Get.offAll(OnBodingTwo()));
    } else {
      Timer(const Duration(seconds: 2), () => Get.offAll(BottomNavBar()));
    }
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Text(
                "Zaveri Trading",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))
          // Image.asset("assets/images/Zaverilogo.png",height: height/4)
          ),
    );
  }
}
