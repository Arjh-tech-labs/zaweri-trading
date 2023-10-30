import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:Zaveri/Custom_BlocObserver/button/custtom_button.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/bottom_bar/bottom_pages/stock_exchange_tabs/Select%20Stocks.dart';

import '../../../utils/medeiaqury/medeiaqury.dart';

class sell extends StatefulWidget {
  const sell({Key? key}) : super(key: key);

  @override
  State<sell> createState() => _sellState();
}

class _sellState extends State<sell> {
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
              SizedBox(height: height / 30),
              GestureDetector(
                onTap: () {
                  Get.to(
                    const SelectStocks(),
                  );
                },
                child: exchange_stock(
                    "assets/images/Ambuja_logo.png",
                    "Ambuja Cement",
                    "Ambuja",
                    "\$254.00",
                    null,
                    notifier.getbluecolor),
              ),
              SizedBox(height: height / 50),
              Image.asset("assets/images/exchange_stock.png",
                  height: height / 14),
              SizedBox(height: height / 50),
              GestureDetector(
                onTap: () {
                  Get.to(
                    const SelectStocks(),
                  );
                },
                child: exchange_stock(
                    "assets/images/airtel.jpg",
                    "Airtel Bharti",
                    "Airtel",
                    "\₹127.00",
                    Icons.calculate_outlined,
                    Colors.transparent),
              ),
              SizedBox(height: height / 15),
              GestureDetector(
                onTap: () {
                  Get.to(
                    const SelectStocks(),
                  );
                },
                child:
                button("Buy", notifier.getbluecolor, notifier.getwihitecolor),
              ),
            ],
          ),
        );

      },
    );
  }

  Widget exchange_stock(image, title, subtitle, price, icon, color) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.sp)),
            border: Border.all(color: color, width: 1.5.sp)),
        height: height / 12,
        child: Row(
          children: [
            SizedBox(width: width / 12),
            Image.asset(image, height: height / 20),
            SizedBox(width: width / 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height / 70),
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: 'Gilroy_Bold',
                          color: notifier.getblck),
                    ),
                    // SizedBox(width: width / 100),
                    const Icon(Icons.keyboard_arrow_down)
                  ],
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'Gilroy-Regular',
                      color: notifier.getgrey),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height / 40),
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        color: notifier.getblck,
                        fontSize: 15.sp,
                        fontFamily: 'Gilroy_Bold',
                      ),
                    ),
                    SizedBox(width: width / 50),
                    Icon(icon),
                    // SizedBox(width: width / 15),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
