import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/button_tabs/Chart.dart';
import '../stocks/controller/hist_controller.dart';
import '../stocks/controller/stock_details_controller.dart';
import '../utils/medeiaqury/medeiaqury.dart';

class Stock_Detail extends StatefulWidget {
  const Stock_Detail({Key? key}) : super(key: key);

  @override
  State<Stock_Detail> createState() => _Stock_DetailState();
}

class _Stock_DetailState extends State<Stock_Detail> {
  final StockController stockController = Get.find();
  final HistController histController = Get.find();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stockController.onClose();
  }

  late ColorNotifier notifier;
  int touchedIndex = -1;

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
              notifier.getwihitecolor, "", notifier.getblck,
              height: height / 15),
          body: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          height: height*0.85,
                          width: width,
                          child: DefaultTabController(
                            length: 3,
                            child: Column(
                              children: <Widget>[
                                // Card(
                                //   elevation: 0.100,
                                //   color: const Color(0xffF9FAFB),
                                //   child: ButtonsTabBar(
                                //     backgroundColor: notifier
                                //         .getwihitecolor,
                                //     unselectedBackgroundColor:
                                //     notifier.getwihitecolor,
                                //     unselectedLabelStyle:
                                //     const TextStyle(color: Colors.red),
                                //     labelStyle: TextStyle(
                                //         color: Colors.black,
                                //         fontFamily: 'Gilroy Medium',
                                //         fontSize: 12.sp,
                                //         fontWeight: FontWeight.bold),
                                //     tabs: [
                                //       Tab(
                                //         child: Container(
                                //           height: height / 19,
                                //           width: width / 4,
                                //           child: const Center(
                                //             child: Text(
                                //               "Chart",
                                //               // style: TextStyle(color: Colors.black,
                                //               //     ),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //       Tab(
                                //         child: Container(
                                //           height: height / 19,
                                //           width: width / 4,
                                //           child: const Center(
                                //             child: Text(
                                //               "Summary",
                                //               // style: TextStyle(
                                //               //     fontFamily: 'Gilroy Medium',
                                //               //     fontSize: 15),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //       Tab(
                                //         child: Container(
                                //           height: height / 19,
                                //           width: width / 4,
                                //           child: const Center(
                                //             child: Text(
                                //               "Live Trade",
                                //               // style: TextStyle(
                                //               //     fontFamily: 'Gilroy Medium',
                                //               //     fontSize: 15),
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                const Expanded(
                                  child: TabBarView(
                                    children: <Widget>[
                                      Chart(),
                                      // Summary(),
                                      // LiveTrade()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      }
    );
  }
}
