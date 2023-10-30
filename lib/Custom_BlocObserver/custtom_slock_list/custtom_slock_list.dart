// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/medeiaqury/medeiaqury.dart';
import '../notifire_clor.dart';

class custtom_button extends StatefulWidget {
  String? title;
  String? subtitle;
  String? price;
  String? up_down;
  custtom_button(
      this.title, this.subtitle, this.price, this.up_down);

  @override
  State<custtom_button> createState() => _custtom_buttonState();
}

class _custtom_buttonState extends State<custtom_button> {
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 5.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title!,
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'Gilroy_Bold',
                        color: notifier.getblck),
                  ),
                  Text(
                    widget.subtitle!,
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontFamily: 'Gilroy-Regular',
                        color: notifier.getgrey),
                  ),
                ],
              ),
              // SizedBox(width: width,),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.price!,
                    style: TextStyle(
                      color: notifier.getblck,
                      fontSize: 13.sp,
                      fontFamily: 'Gilroy_Bold',
                    ),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_drop_up_outlined,
                        color: const Color(0xff19C09A),
                        size: 20.sp,
                      ),
                      Text(
                        widget.up_down!,
                        style: TextStyle(
                            color: const Color(0xff19C09A), fontSize: 12.sp),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      }
    );
  }
}
