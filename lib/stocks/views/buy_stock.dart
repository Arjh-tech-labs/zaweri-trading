import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/button/custtom_button.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/screens/Payment%20Method/Payment%20Method.dart';
import '../../../utils/medeiaqury/medeiaqury.dart';
import '../../card_type/Custtom_csrd_type.dart';
import '../../screens/Payment Method/Confirm Order.dart';
import '../../screens/Payment Method/choice_payment.dart';

class NewBuyStock extends StatefulWidget {
  const NewBuyStock({Key? key}) : super(key: key);
  @override
  State<NewBuyStock> createState() => _NewBuyStockState();
}

class _NewBuyStockState extends State<NewBuyStock> {
  late ColorNotifier notifier;
  TextEditingController amountController = TextEditingController();
  late final String amount ;
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(builder: (_, child) {
      return Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: CustomAppBar(
          notifier.getwihitecolor,
          "Buy Stock",
          notifier.getblck,
          height: height / 15,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height / 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\₹",
                    style: TextStyle(
                        fontSize: 40.sp,
                        color: notifier.getblck,
                        fontFamily: 'Gilroy_Bold'),
                  ),
                  SizedBox(width: width / 70),
                  Price_textfild()
                ],
              ),
              SizedBox(height: height / 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  max_price("1"),
                  max_price("10"),
                  max_price("50"),
                  max_price("100"),
                ],
              ),
              SizedBox(height: height / 20),
              GestureDetector(
                onTap: () {
                  // Get.to(const ConfirmOrder());
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
                  // Get.to(const ConfirmOrder());
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
                  // Get.to(const ConfirmOrder());
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
                  // Get.to(const ConfirmOrder());
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
              SizedBox(height: height / 15),
              GestureDetector(
                  onTap: () {
                    Get.to( ConfirmOrder(amount: amount));
                  },
                  child: button("Continue", notifier.getbluecolor,
                      notifier.getwihitecolor)),
              // GestureDetector(
              //     onTap: () {
              //       Get.to(choice_payment());
              //     },
              //     child: button(
              //         "Buy", notifier.getbluecolor, notifier.getwihitecolor))
            ],
          ),
        ),
      );
    });
  }

  Widget max_price(txt) {
    return Container(
      height: height / 15,
      width: width / 5.5,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                amountController.text=txt;
                amount = amountController.text.toString();
                print(amount);
              });
            },
            child: Text(
              txt,
              style: TextStyle(
                  fontSize: 25.sp,
                  color: notifier.getgrey,
                  fontFamily: 'Gilroy_Bold'),
            ),
          ),
        ),
      ),
    );
  }

  Widget Price_textfild() {
    return Container(
      width: width / 5,
      child: TextField(
        controller: amountController,
        onChanged: (value) {
          print(amountController);
        },
        keyboardType: TextInputType.number,
        style: TextStyle(
            fontSize: 40.sp,
            color: notifier.getblck,
            fontFamily: 'Gilroy_Bold'),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "0",
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            hintStyle: TextStyle(color: notifier.getblck, fontSize: 40.sp)),
      ),
    );
  }
}
