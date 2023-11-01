import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/button/custtom_button.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/screens/Payment%20Method/Confirm%20Order.dart';
import 'package:Zaveri/screens/Payment%20Method/choice_payment.dart';
import '../../card_type/Custtom_csrd_type.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
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
                SizedBox(height: height / 12),
                Center(
                  child:
                  Image.asset("assets/images/Apple.png", height: height / 15),
                ),
                SizedBox(height: height / 20),
                Text(
                  "AAPL",
                  style: TextStyle(
                      color: notifier.getblck,
                      fontSize: 22.sp,
                      fontFamily: 'Gilroy_Bold'),
                ),
                SizedBox(height: height / 200),
                Text(
                  "Apple Inc.",
                  style: TextStyle(
                      color: notifier.getgrey,
                      fontSize: 15.sp,
                      fontFamily: 'Gilroy-Regular'),
                ),
                SizedBox(height: height / 25),
                Text(
                  "\₹127.00",
                  style: TextStyle(
                      color: notifier.getblck,
                      fontSize: 36.sp,
                      fontFamily: 'Gilroy_Bold'),
                ),
                SizedBox(height: height / 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/null.png", height: height / 30),
                    SizedBox(width: width / 30),
                    Text(
                      "You can buy stock with a bank account\nor debit card.",
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Gilroy_Medium',
                          color: const Color(0xff1E40AF)),
                    )
                  ],
                ),
                SizedBox(height: height / 15),
                Row(
                  children: [
                    SizedBox(width: width / 20),
                    Text(
                      "Choose payment method",
                      style:
                      TextStyle(fontSize: 16.sp, fontFamily: 'Gilroy_Bold'),
                    )
                  ],
                ),
                SizedBox(height: height / 50),
                GestureDetector(
                  onTap: () {
                    Get.to(const choice_payment());
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
                // ExpansionTile(
                //   title: payment_type("assets/images/debit_card.png",
                //       "Debit Card", "Invest small amounts",notifier.getblck,notifier.getgrey),
                //   children: <Widget>[
                //     ListTile(
                //       title: Column(
                //         children: [
                //           SizedBox(height: height / 200),
                //           payment_type("assets/images/bank_tranfer.png",
                //               "Bank Transfer", "Invest big amounts",notifier.getblck,notifier.getgrey),
                //           SizedBox(height: height / 35),
                //           Text(
                //             "Another Payment",
                //             style: TextStyle(
                //                 color: notifier.getgrey,
                //                 fontSize: 13.sp,
                //                 fontFamily: 'Gilroy_Bold'),
                //           ),
                //           SizedBox(height: height / 35),
                //           payment_type("assets/images/apple_pay.png", "Apple Pay",
                //               "Connect your Apple Pay",notifier.getblck,notifier.getgrey),
                //           SizedBox(height: height / 70),
                //           payment_type("assets/images/pay_pal.png", "PayPal",
                //               "Connect your PayPal account",notifier.getblck,notifier.getgrey),
                //           SizedBox(height: height / 30),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: height / 20),
                GestureDetector(
                  onTap: () {
                    Get.to( ConfirmOrder(amount:"300"));
                  },
                  child: button(
                      "Continue", notifier.getbluecolor,
                      notifier.getwihitecolor),
                ),
                SizedBox(height: height / 20),
              ],
            ),
          ),
        );
      }
    );
  }
}
