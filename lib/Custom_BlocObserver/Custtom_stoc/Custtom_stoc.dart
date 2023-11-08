import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/medeiaqury/medeiaqury.dart';
import '../notifire_clor.dart';

// ignore: must_be_immutable
class Custtom_stoc extends StatefulWidget {
  final String? title;
  final String? qty;
  final String? subtitle;
  final String? stockprice;
  final String? up_down;
  final Color? iconcolor;
  const Custtom_stoc(this.title,this.qty, this.subtitle,
      this.stockprice, this.up_down, this.iconcolor);

  @override
  State<Custtom_stoc> createState() => _Custtom_stocState();
}

class _Custtom_stocState extends State<Custtom_stoc> {
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
      builder: (_,child)
    {
      return
        Container(
        // height: height / 5,
        width: width / 2.1,
        margin: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            // color: notifier.getwihitecolor,
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(5)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.title!,
                  style: TextStyle(
                      color: notifier.getblck,
                      fontSize: 15.sp,
                      fontFamily: 'Gilroy_Bold'),
                ), const Spacer(),
                Text(
                  widget.qty!,
                  style: TextStyle(
                      color: notifier.getblck,
                      fontSize: 12.sp,
                      fontFamily: 'Gilroy_Bold'),
                ),
              ],
            ),
            Text(
              widget.subtitle!,
              style: TextStyle(
                  color: notifier.getgrey,
                  fontSize: 11.sp,
                  fontFamily: 'Gilroy-Regular'),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text(
                  widget.stockprice!,
                  style: TextStyle(
                      color: notifier.getblck,
                      fontFamily: 'Gilroy_Bold',
                      fontSize: 15.sp),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_drop_down,
                  color: widget.iconcolor!,
                ),
                Text(
                  widget.up_down!,
                  style: TextStyle(
                      color: const Color(0xffFC6C6B), fontSize: 13.sp),
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
