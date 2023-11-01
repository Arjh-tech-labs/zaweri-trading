import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/button/custtom_button.dart';
import 'package:Zaveri/bottom_bar/bottom_pages/stock_exchange_tabs/Transaction%20Complete.dart';

import '../../Custom_BlocObserver/notifire_clor.dart';
import '../../card_type/Custtom_csrd_type.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class ConfirmOrder extends StatefulWidget {
  final String amount;
  const ConfirmOrder({Key? key, required this.amount,}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();

}

class _ConfirmOrderState extends State<ConfirmOrder> {

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
          appBar: CustomAppBar(
              notifier.getwihitecolor, "Confirm Order", notifier.getblck,
              height: height / 15),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height / 12),
                Center(
                  child: Text(
                    "Total Cost",
                    style: TextStyle(
                        color: notifier.getgrey,
                        fontSize: 14.sp,
                        fontFamily: 'Gilroy_Medium'),
                  ),
                ),
                Center(
                  child: Text(
                    "\₹${widget.amount}",
                    style: TextStyle(
                        color: notifier.getblck,
                        fontSize: 35.sp,
                        fontFamily: 'Gilroy_Bold'),
                  ),
                ),
                SizedBox(height: height / 35),
                Row(
                  children: [
                    SizedBox(width: width / 15),
                    Text(
                      "Stock you buy",
                      style: TextStyle(
                          color: notifier.getgrey,
                          fontFamily: 'Gilroy_Medium',
                          fontSize: 14.sp),
                    ),
                  ],
                ),
                SizedBox(height: height / 25),
                exchange_stock(
                    "assets/images/icici.png", "icici bank", "icici",
                    "\₹${widget.amount}"),
                SizedBox(height: height / 25),
                Row(
                  children: [
                    SizedBox(width: width / 15),
                    Text(
                      "Payment method",
                      style: TextStyle(
                          color: notifier.getgrey,
                          fontFamily: 'Gilroy_Medium',
                          fontSize: 14.sp),
                    ),
                  ],
                ),
                SizedBox(height: height / 40),
                Padding(
                  padding: EdgeInsets.only(left: width / 17, right: width / 20),
                  child: payment_type(
                      "assets/images/debit_card.png",
                      "Sunder Pichai",
                      "***************2356",
                      notifier.getblck,
                      notifier.getgrey,
                      notifier.getbluecolor,
                      height / 27),
                ),
                SizedBox(height: height / 25),
                Row(
                  children: [
                    SizedBox(width: width / 15),
                    Text(
                      "Payment details",
                      style: TextStyle(
                          color: notifier.getgrey,
                          fontFamily: 'Gilroy_Medium',
                          fontSize: 14.sp),
                    ),
                  ],
                ),
                SizedBox(height: height / 35),
                Paymentdetails("assets/images/Funding.png", "Funding source",
                    "Zaveri Trading", notifier.getbluecolor),
                SizedBox(height: height / 100),
                Paymentdetails(
                    "assets/images/Approx.png", "Approx. Share Price",
                    "\₹${widget.amount}", notifier.getblck),
                SizedBox(height: height / 100),
                Paymentdetails("assets/images/Approx.Shares.png",
                    "Approx. Shares", "0.003", notifier.getblck),
                SizedBox(height: height / 100),
                Paymentdetails(
                    "assets/images/Fee.png", "Fee", "\₹1", notifier.getblck),
                SizedBox(height: height / 20),
                GestureDetector(
                    onTap: () {
                      Get.to(const TransactionComplete());
                    },
                    child: button("Confirm", notifier.getbluecolor,
                        notifier.getwihitecolor)),
                SizedBox(height: height / 30),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget exchange_stock(image, title, subtitle, price) {
    return Center(
      child: Container(
        height: height / 12,
        width: width / 1.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: notifier.getconcirmstockbuycolor,
        ),
        child: Row(
          children: [
            SizedBox(width: width / 12),
            Image.asset(image, height: height / 20),
            SizedBox(width: width / 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height / 50),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'Gilroy_Bold',
                      color: notifier.getblck),
                ),
                SizedBox(width: width / 100),
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
                SizedBox(height: height / 35),
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        color: notifier.getblck,
                        fontSize: 17.sp,
                        fontFamily: 'Gilroy_Bold',
                      ),
                    ),
                    SizedBox(width: width / 15),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget Paymentdetails(image, name, subname, color) {
    return Row(
      children: [
        SizedBox(width: width / 17),
        Image.asset(image, height: height / 30),
        SizedBox(width: width / 40),
        Text(
          name,
          style: TextStyle(
              fontFamily: 'Gilroy_Medium',
              fontSize: 15.sp,
              color: notifier.getblck),
        ),
        Spacer(),
        Text(
          subname,
          style: TextStyle(
              fontFamily: 'Gilroy_Bold', fontSize: 15.sp, color: color),
        ),
        SizedBox(width: width / 17),
      ],
    );
  }
}
