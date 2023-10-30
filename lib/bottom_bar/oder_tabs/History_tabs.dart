import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/bottom_bar/Stock_Detail.dart';
import 'package:Zaveri/calenderrr.dart';

import '../../Custom_BlocObserver/custtom_slock_list/custtom_slock_list.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class Historytabs extends StatefulWidget {
  const Historytabs({Key? key}) : super(key: key);

  @override
  State<Historytabs> createState() => _HistorytabsState();
}

class _HistorytabsState extends State<Historytabs> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      builder:  (_,child) {
        return Scaffold(
          backgroundColor: notifier.getwihitecolor,
          body: Column(
            children: [
              calender(
                notifier.getwihitecolor,
                notifier.getwihitecolor,
                notifier.getwihitecolor,
                notifier.getwihitecolor,
                notifier.getblck,
                notifier.getblck,
              ),
              // SizedBox(height: height / 30),
              Row(
                children: [
                  SizedBox(width: width / 20),
                  Text(
                    "Recent Order",
                    style: TextStyle(color: notifier.getblck, fontSize: 16.sp),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: width / 20),
                  Text(
                    "Monday, 14 June 2021",
                    style: TextStyle(color: notifier.getgrey, fontSize: 13.sp),
                  ),
                ],
              ),
              SizedBox(height: height / 15),
              GestureDetector(
                onTap: () {
                  Get.to(const Stock_Detail());
                },
                child: custtom_button(
                    "Kotak Mahindra Bank",
                    "Kotak Mahindra PVL.",
                    "\₹326,23",
                    "2,87%"),
              ),
              SizedBox(height: height / 25),
              GestureDetector(
                onTap: () {
                  Get.to(const Stock_Detail());
                },
                child: custtom_button("HDFC bank",
                    "HDFC Inc.", "\₹326,23", "2,87%"),
              ),
              SizedBox(height: height / 25),
              GestureDetector(
                onTap: () {
                  Get.to(const Stock_Detail());
                },
                child: custtom_button( "Airtel Bharti",
                    "Airtel", "\₹326,23", "2,87%"),
              ),
              SizedBox(height: height / 25),
              GestureDetector(
                onTap: () {
                  Get.to(const Stock_Detail());
                },
                child: custtom_button("icici bank",
                    "icici", "\₹326,23", "2,87%"),
              ),
            ],
          ),
        );
      },
    );
  }
}
