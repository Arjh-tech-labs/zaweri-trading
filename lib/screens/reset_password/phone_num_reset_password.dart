import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Zaveri/Custom_BlocObserver/button/custtom_button.dart';
import 'package:Zaveri/Custom_BlocObserver/custtom_textfild/consttom_textfild.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/screens/reset_password/email_reset_password.dart';

import '../../Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import '../../utils/medeiaqury/medeiaqury.dart';
import '../Auth/vericication.dart';

class phone_num_reset_password extends StatefulWidget {
  const phone_num_reset_password({Key? key}) : super(key: key);

  @override
  State<phone_num_reset_password> createState() =>
      _phone_num_reset_passwordState();
}

class _phone_num_reset_passwordState extends State<phone_num_reset_password> {
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

  String? _selectedindex;

  final List<Map> _myjson = [
    {
      'id': '1',
      'image': 'assets/images/flag.png',
    },
    {
      'id': '2',
      'image': 'assets/images/flagtwo.png.png',
    },
    {
      'id': '3',
      'image': 'assets/images/flagthree.jpg',
    },
    {
      'id': '4',
      'image': 'assets/images/flagfour.png',
    },
    {
      'id': '5',
      'image': 'assets/images/flagfive.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      builder:  (_,child) {
        return  Scaffold(
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
                          "Forget Password",
                          style: TextStyle(
                              color: notifier.getblck,
                              fontSize: 26.sp,
                              fontFamily: 'Gilroy_Bold'),
                        ),
                        SizedBox(height: height / 25),
                        Text(
                          // "Please enter Principal Registration Number and we will send\nyou a link to reset your password.",
                          "Please enter Principal Registration Number .",
                          style:
                          TextStyle(fontSize: 16.sp, color: notifier.getgrey),
                        ),
                        SizedBox(height: height / 50),
                        Row(
                          children: [
                            DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                child: DropdownButton<String>(
                                  hint: Image.asset("assets/images/flagfour.png",
                                      height: height / 25),
                                  value: _selectedindex,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedindex = newValue;
                                    });
                                  },
                                  items: _myjson.map((Map map) {
                                    return DropdownMenuItem<String>(
                                      value: map["id"].toString(),
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            map["image"].toString(),
                                            width: 35.w,
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(width: width / 20),
                            Container(
                              width: width / 1.6,
                              child: Customtextfild.textField(
                                  "Mobile No",
                                  notifier.getbluecolor,
                                  Icons.add,
                                  notifier.getgrey,
                                  notifier.getblck,
                                  notifier.getblck,
                                  notifier.getgrey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height / 1.9),
                GestureDetector(
                  onTap: () {
                    Get.to(

                      // const email_reset_password(),
                      const veryfication(),
                    );
                  },
                  child: button("Next", notifier.getbluecolor,
                      notifier.getwihitecolor),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
