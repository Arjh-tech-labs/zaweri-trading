import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/button/custtom_button.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/screens/Payment%20Method/Payment%20Method.dart';
import '../../../utils/medeiaqury/medeiaqury.dart';

class BuyStock extends StatefulWidget {
  const BuyStock({Key? key}) : super(key: key);

  @override
  State<BuyStock> createState() => _BuyStockState();
}

class _BuyStockState extends State<BuyStock> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      builder: (_,child) {
        return Scaffold(
          backgroundColor: notifier.getwihitecolor,
          appBar: CustomAppBar(
            notifier.getwihitecolor, "Buy Stock", notifier.getblck,
            height: height / 15,),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height / 20),
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
                SizedBox(height: height / 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    max_price("\₹1"),
                    max_price("\₹10"),
                    max_price("\₹50"),
                    max_price("\₹100"),
                  ],
                ),
                SizedBox(height: height / 20),
                GestureDetector(
                    onTap: () {
                      Get.to(const PaymentMethod());
                    },
                    child: button("Buy", notifier.getbluecolor,
                        notifier.getwihitecolor))
              ],
            ),
          ),
        );
      }
    );
  }

  Widget max_price(txt) {
    return Container(
      height: height/15,
      width: width/5.5,

      child: Card(elevation: 1,shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(
                fontSize: 25.sp, color: notifier.getgrey, fontFamily: 'Gilroy_Bold'),
          ),
        ),
      ),
    );
  }

  Widget Price_textfild() {
    return Container(
      width: width / 5,
      child: TextField(
        keyboardType: TextInputType.number,
        style: TextStyle(
            fontSize: 30.sp,

            color: notifier.getblck,
            fontFamily: 'Gilroy_Bold'),
        decoration:  InputDecoration(border: InputBorder.none,hintText: "0",contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 8),hintStyle: TextStyle(color: notifier.getblck,fontSize: 40.sp)),
      ),
    );
  }
}
