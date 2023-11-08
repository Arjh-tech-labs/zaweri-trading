import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';

import '../../Controller/order_controller.dart';
import '../../Custom_BlocObserver/Custtom_app_bar/newCustom_appBar.dart';
import '../../Custom_BlocObserver/custtom_slock_list/custom_stock_list.dart';
import '../../Custom_BlocObserver/custtom_slock_list/custtom_slock_list.dart';
import '../../utils/medeiaqury/medeiaqury.dart';
import '../oder_tabs/History_tabs.dart';
import '../oder_tabs/Order_tab.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> with SingleTickerProviderStateMixin {
  late ColorNotifier notifier;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: list.length, vsync: this);
  }

  List<Widget> list = [
    Row(
      children: const [
        Tab(
          icon: Icon(Icons.stacked_bar_chart, color: Colors.black),
        ),
        SizedBox(width: 4),
        Text("Order", style: TextStyle(color: Colors.black))
      ],
    ),
    Row(
      children: const [
        Tab(
          icon: Icon(Icons.local_activity, color: Colors.white),
        ),
        SizedBox(width: 4),
        Text("History", style: TextStyle(color: Colors.white))
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      builder:  (_,child) {
        return Scaffold(
            backgroundColor: notifier.getwihitecolor,
            appBar: NewCustomAppBar(notifier.getwihitecolor, "Order", notifier.getblck,
                height: height/ 15),
            body:
            ordertabs(),
            // SingleChildScrollView(
            //   child: Column(
            //     children: [
            //       SizedBox(height: height / 50),
            //       Container(
            //         height: height,
            //         child: Padding(
            //           padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
            //           child: Column(
            //             children: [
            //               Container(
            //                 height: height / 17,
            //                 decoration: BoxDecoration(
            //                   color: Colors.transparent,
            //                   borderRadius: BorderRadius.circular(
            //                     25.0,
            //                   ),
            //                 ),
            //                 child: TabBar(
            //                   unselectedLabelStyle:
            //                   TextStyle(color: notifier.getblck),
            //                   controller: _tabController,
            //                   indicator: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(25.0),
            //                       color: Colors.transparent),
            //                   labelColor: notifier.getblck,
            //                   unselectedLabelColor: Colors.grey,
            //                   tabs: [
            //                     Tab(
            //                       child: Row(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           Text(
            //                             "Order",
            //                             style: TextStyle(
            //                               fontSize: 14.sp,
            //                             ),
            //                           )
            //                         ],
            //                       ),
            //                     ),
            //                     Tab(
            //                       child: Row(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           Text(
            //                             "History",
            //                             style: TextStyle(
            //                               fontSize: 14.sp,
            //                             ),
            //                           )
            //                         ],
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               Expanded(
            //                 child: TabBarView(
            //                   controller: _tabController,
            //                   children: const [ordertabs(), Historytabs()],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          );

      },
    );
  }
}
