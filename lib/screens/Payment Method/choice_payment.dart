import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/button/custtom_button.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/screens/Payment%20Method/Confirm%20Order.dart';
import '../../card_type/Custtom_csrd_type.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class choice_payment extends StatefulWidget {
  const choice_payment({Key? key}) : super(key: key);

  @override
  State<choice_payment> createState() => _choice_paymentState();
}

class _choice_paymentState extends State<choice_payment> {
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
              notifier.getwihitecolor, "Payment Method", notifier.getblck,
              height: height / 15),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height / 50),
                GestureDetector(
                  onTap: () {
                    Get.to(const ConfirmOrder());
                  },
                  child: payment_type(
                      "assets/images/debit_card.png",
                      "Debit Card",
                      "Invest small amounts",
                      notifier.getblck,
                      notifier.getgrey,
                      notifier.getbluecolor,
                      height / 27),
                ),
                SizedBox(height: height / 70),
                GestureDetector(
                  onTap: () {
                    Get.to(const ConfirmOrder());
                  },
                  child: payment_type(
                      "assets/images/bank_tranfer.png",
                      "Bank Transfer",
                      "Invest big amounts",
                      notifier.getblck,
                      notifier.getgrey,
                      notifier.getbluecolor,
                      height / 27),
                ),
                SizedBox(height: height / 35),
                Text(
                  "Another Payment",
                  style: TextStyle(
                      color: notifier.getgrey,
                      fontSize: 13.sp,
                      fontFamily: 'Gilroy_Bold'),
                ),
                SizedBox(height: height / 35),
                GestureDetector(
                  onTap: () {
                    Get.to(const ConfirmOrder());
                  },
                  child: payment_type(
                      "assets/images/apple_pay.png",
                      "Apple Pay",
                      "Connect your Apple Pay",
                      notifier.getblck,
                      notifier.getgrey,
                      notifier.getblck,
                      height / 45),
                ),
                SizedBox(height: height / 70),
                GestureDetector(
                  onTap: () {
                    Get.to(const ConfirmOrder());
                  },
                  child: payment_type(
                      "assets/images/pay_pal.png",
                      "PayPal",
                      "Connect your PayPal account",
                      notifier.getblck,
                      notifier.getgrey,
                      null,
                      height / 27),
                ),
                SizedBox(height: height / 3),
                GestureDetector(
                    onTap: () {
                      Get.to(const ConfirmOrder());
                    },
                    child: button("Continue", notifier.getbluecolor,
                        notifier.getwihitecolor))
              ],
            ),
          ),
        );
      }
    );
  }
}
