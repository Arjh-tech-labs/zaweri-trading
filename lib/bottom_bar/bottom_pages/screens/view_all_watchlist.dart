import 'dart:math';

import 'package:Zaveri/main.dart';
import 'package:Zaveri/utils/medeiaqury/medeiaqury.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Custom_BlocObserver/custtom_slock_list/custtom_slock_list.dart';
import '../../../stocks/controller/hist_controller.dart';
import '../../../stocks/controller/stock_details_controller.dart';
import '../../Stock_Detail.dart';
import '../../models/WishlistModel.dart';

class AllWatchList extends StatefulWidget {
  const AllWatchList({Key? key}) : super(key: key);

  @override
  State<AllWatchList> createState() => _AllWatchListState();
}

class _AllWatchListState extends State<AllWatchList> {

  final SurajController surajController = Get.find();
  final StockController stockController = Get.find();
  final HistController histController = Get.find();
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
        title:   Text(
          "Watchlist",
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors.black,
              fontFamily: 'Gilroy_Bold'),
        ),
      ),
     body: GetBuilder<SurajController>(builder: (surajController) {
       if (surajController.suraj.isEmpty) {
         return SizedBox(
             height: height*60,
             child: isLoading
                 ? Center(child: CircularProgressIndicator()) // Display loading indicator
                 : Center(child: Text("No any your stock in Watchlist"))); // or any other error handling logic
       }
       return ListView.separated(
         // shrinkWrap: true,
         // physics: NeverScrollableScrollPhysics(),
         itemCount: surajController.suraj.length,
         itemBuilder: (context, index) {
           final stock = surajController.suraj[index];
           final sendExchange = stock['exchange'].toString();
           final sendToken = stock['symbolToken'].toString();
           return GestureDetector(
               onTap: () {
                 stockController.calEverySec(
                     exchange: sendExchange, token: sendToken);
                 histController.histData(
                     exchange: sendExchange, token: sendToken);
                 Get.to(Stock_Detail());
               },
               child: custtom_button(
                   stock['tradingSymbol'].toString(),
                   stock['exchange'].toString(),
                   "\₹${stock['ltp']}",
                   '${stock['percentChange']}%'));
         },
         separatorBuilder: (BuildContext context, int index) {
           return Divider(
             thickness: 0.5,
           );
         },
       );
     }),
    );
  }
}
