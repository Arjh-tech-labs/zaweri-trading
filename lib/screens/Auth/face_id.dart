import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/screens/Auth/fingerprint.dart';
import '../../Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import '../../Custom_BlocObserver/button/custtom_button.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class faceid extends StatefulWidget {
  const faceid({Key? key}) : super(key: key);

  @override
  State<faceid> createState() => _faceidState();
}

class _faceidState extends State<faceid> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: width / 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Face ID Auth",
                          style: TextStyle(
                              color: notifier.getblck,
                              fontSize: 26.sp,
                              fontFamily: 'Gilroy_Bold'),
                        ),
                        SizedBox(height: height / 25),
                        Text(
                          "You can use face authentication to login\ninto GoGrow",
                          style:
                          TextStyle(fontSize: 16.sp, color: notifier.getgrey),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height / 20),
                Center(
                  child: Image.asset("assets/images/faceAuth.png",
                      height: height / 2.7),
                ),
                SizedBox(height: height / 5),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const fingerprint(),
                        ),
                      );
                    },
                    child: button("Scan my face", notifier.getbluecolor,
                        notifier.getwihitecolor))
              ],
            ),
          ),
        );
      }
    );
  }
}
