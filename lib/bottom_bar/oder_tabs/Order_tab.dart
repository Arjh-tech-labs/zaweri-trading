import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/bottom_bar/Stock_Detail.dart';
import '../../Controller/order_controller.dart';
import '../../Custom_BlocObserver/custtom_slock_list/custom_stock_list.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class ordertabs extends StatefulWidget {
  const ordertabs({Key? key}) : super(key: key);

  @override
  State<ordertabs> createState() => _ordertabsState();
}

class _ordertabsState extends State<ordertabs> {
  late ColorNotifier notifier;
  final OrderController orderController = Get.find();
  // final OrderController orderController = Get.put(OrderController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderController.orderApi();

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
          body: GetBuilder<OrderController>(
            builder: (orderController) {
              return ListView.separated(
                shrinkWrap: true,
                itemCount: orderController.orderList.length,

                itemBuilder: (context, index) {
                  final order = orderController.orderList[index];
                  // final sendExchange = portfolio['exchange'].toString();
                  // final sendToken = portfolio['symbolToken'].toString();
                  return Column(
                    children: [
                      // Text("jfcghv")
                      GestureDetector(
                          onTap: () {
                            // stockController.calEverySec(
                            //     exchange: sendExchange, token: sendToken);
                            // histController.histData(
                            //     exchange: sendExchange, token: sendToken);
                            // Get.to(Stock_Detail());
                          },
                          child: CustomStockList(
                            "${order['created_at']}", "${order['producttype']}", "${order['stock_symbol']}", "${order['quantity']}","${order['ordertype']}","Avg \₹${order['price']}",
                          )
                      ),
                    ],
                  );
                }, separatorBuilder: (BuildContext context, int index) { return Divider(
                thickness: 0.5,
              ); },
                );
            }
          ),
        );
      },
    );
  }

  // Widget buton(colorbutton, buttontext, buttontextcolor) {
  //   return Center(
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           LayoutBuilder(builder: (context, constraints) {
  //             print(constraints);
  //             return Container(
  //               height: height / 15,
  //               width: width / 1.9,
  //               decoration: BoxDecoration(
  //                 color: colorbutton!,
  //                 borderRadius: BorderRadius.circular(15.sp),
  //               ),
  //               child: Center(
  //                 child: Text(
  //                   buttontext!,
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(
  //                       fontFamily: 'Gilroy_Medium',
  //                       fontSize: 15.sp,
  //                       color: buttontextcolor),
  //                 ),
  //               ),
  //             );
  //           }),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
