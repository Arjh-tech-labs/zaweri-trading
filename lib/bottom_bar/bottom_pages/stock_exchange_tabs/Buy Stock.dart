import 'package:Zaveri/bottom_bar/bottom_pages/stock_exchange_tabs/ModleView/buySellModle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/button/custtom_button.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import '../../../Controller/buy_stock_controller.dart';
import '../../../utils/medeiaqury/medeiaqury.dart';

class BuyStock extends StatefulWidget {
  final String? stokeName;
  final String? stokeExg;
  final String? stokePrice;
  final String? stokeToken;
  final String? stokeType;
  const BuyStock({Key? key, this.stokeName, this.stokeExg, this.stokePrice,  this.stokeToken,  this.stokeType})
      : super(key: key);

  @override
  State<BuyStock> createState() => _BuyStockState();
}

class _BuyStockState extends State<BuyStock> {
  late ColorNotifier notifier;
  double total = 0;
  BuyStockController buyStockController = Get.put(BuyStockController());
  TextEditingController qtyController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loading.value = false;
  }
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.stokeName ?? '',
                      style: TextStyle(
                          fontFamily: 'Gilroy_Bold',
                          fontSize: 20.sp,
                          color: notifier.getblck),
                    ),
                    SizedBox(width: width / 100),
                    Text(
                      widget.stokeExg ?? '',
                      style: TextStyle(
                          fontFamily: 'Gilroy_Bold',
                          fontSize: 20.sp,
                          color: notifier.getgrey),
                    ),
                    Spacer(),
                    Text(
                      "\₹${widget.stokePrice ?? ''}",
                      style: TextStyle(
                          color: notifier.getblck,
                          fontFamily: 'Gilroy_Bold',
                          fontSize: 27.sp),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Qtn",
                      style: TextStyle(
                          fontFamily: 'Gilroy_Bold',
                          fontSize: 20.sp,
                          color: notifier.getblck),
                    ),
                    Container(
                      height: 40.h,
                      width: 100,
                      child: TextField(
                        controller: qtyController,
                        style: TextStyle(color: Colors.blue),
                        onChanged: (value) {
                          if (value.length != 0) {
                            total = double.parse(value) *
                                double.parse(widget.stokePrice!);
                          } else {
                            total = 0;
                          }
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                          // stockSearchController.fetchFilteredStocks(filter: name);
                        },
                        // obscureText: hidePassword, //show/hide password
                        decoration: InputDecoration(
                          label: Text("Enter Qtn"),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                          labelStyle: TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black45, width: 1),
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Required Balance",
                      style: TextStyle(
                          fontFamily: 'Gilroy_Bold',
                          fontSize: 20.sp,
                          color: notifier.getgrey),
                    ),
                    Spacer(),
                    Text(
                      "\₹${total.roundToDouble()}",
                      style: TextStyle(
                          color: notifier.getgrey,
                          fontFamily: 'Gilroy_Bold',
                          fontSize: 20.sp),
                    ),
                  ],
                ),

                SizedBox(height: height / 8),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     max_price("\₹1"),
                //     max_price("\₹10"),
                //     max_price("\₹50"),
                //     max_price("\₹100"),
                //   ],
                // ),

                GestureDetector(
                    onTap: () {
                      CheckMarketTime();
                      // Get.to(const PaymentMethod());
                    },
                    child: Obx(() => loading.value
                        ? Center(
                      child: CircularProgressIndicator(),
                    )
                        : button("${widget.stokeType??""}".toUpperCase(), notifier.getbluecolor,
                        notifier.getwihitecolor)))
              ],
            ),
          ),
        ),
      );
    });
  }
  
  CheckMarketTime(){
    var now = DateTime.now();
    var currentTime = TimeOfDay.fromDateTime(now);
    // Define the time conditions
    var startTime = TimeOfDay(hour: 9, minute: 15);
    var endTime = TimeOfDay(hour: 15, minute: 30);

    DateTime currentDateTime = DateTime(now.year, now.month, now.day, currentTime.hour, currentTime.minute);
    DateTime startDateTime = DateTime(now.year, now.month, now.day, startTime.hour, startTime.minute);
    DateTime endDateTime = DateTime(now.year, now.month, now.day, endTime.hour, endTime.minute);
    
    if(currentDateTime.isBefore(startDateTime) || currentDateTime.isAfter(endDateTime)){
      Fluttertoast.showToast(
        msg: 'Market Closed',
        backgroundColor: Colors.black,
      );

    }else{
      buyStockController.buyStockApi(
          stokeName: widget.stokeName ?? '',
          stokeExg: widget.stokeExg ?? '',
          stokePrice: widget.stokePrice??"",
          stokeToken: widget.stokeToken ?? '',
          stokeQty: qtyController.text,
          stokeType: widget.stokeType??"",
          context: context
      );
      setState(() {
        loading.value = true;
      });
    }
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
          child: Text(
            txt,
            style: TextStyle(
                fontSize: 25.sp,
                color: notifier.getgrey,
                fontFamily: 'Gilroy_Bold'),
          ),
        ),
      ),
    );
  }
}
