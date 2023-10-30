// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/medeiaqury/medeiaqury.dart';
import '../notifire_clor.dart';

class bu_sell_button extends StatefulWidget {
  String? buttontext;
  Color? colorbutton;
  Color? buttontextcolor;

  bu_sell_button(this.buttontext, this.colorbutton, this.buttontextcolor);

  @override
  State<bu_sell_button> createState() => _bu_sell_buttonState();
}

class _bu_sell_buttonState extends State<bu_sell_button> {
  get borderRadius => BorderRadius.circular(15);

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
      builder: (_,child) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LayoutBuilder(builder: (context, constraints) {
                  print(constraints);
                  return Container(
                    height: height / 15,
                    width: width / 2.6,
                    decoration: BoxDecoration(
                      color: widget.colorbutton!,
                      borderRadius: borderRadius,
                    ),
                    child: Center(
                      child: Text(
                        widget.buttontext!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Gilroy_Medium',
                            fontSize: 15.sp,
                            color: widget.buttontextcolor),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      }
    );
  }
}
