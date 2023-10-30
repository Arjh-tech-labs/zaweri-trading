import 'package:buttons_tabbar/buttons_tabbar.dart';
 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/buy_sell_button/buy_sell_button.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/bottom_bar/bottom_pages/stock_exchange_tabs/Buy%20Stock.dart';
import 'package:Zaveri/button_tabs/Chart.dart';
import 'package:Zaveri/button_tabs/Live%20Trade.dart';
import 'package:Zaveri/button_tabs/Summary.dart';
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height / 1.3,
                  width: width / 1.1,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(height: height / 50),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              height: height / 1.48,
                              width: width,
                              child: DefaultTabController(
                                length: 1,
                                child: Column(
                                  children: <Widget>[
                                    Card(
                                      elevation: 0.100,
                                      color: const Color(0xffF9FAFB),
                                      child: ButtonsTabBar(
                                        backgroundColor: notifier
                                            .getwihitecolor,
                                        unselectedBackgroundColor:
                                        notifier.getwihitecolor,
                                        unselectedLabelStyle:
                                        const TextStyle(color: Colors.red),
                                        labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Gilroy Medium',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                        tabs: [
                                          Tab(
                                            child: Container(
                                              height: height / 19,
                                              width: width / 4,
                                              child: const Center(
                                                child: Text(
                                                  "Chart",
                                                  // style: TextStyle(color: Colors.black,
                                                  //     ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Tab(
                                          //   child: Container(
                                          //     height: height / 19,
                                          //     width: width / 4,
                                          //     child: const Center(
                                          //       child: Text(
                                          //         "Summary",
                                          //         // style: TextStyle(
                                          //         //     fontFamily: 'Gilroy Medium',
                                          //         //     fontSize: 15),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          // Tab(
                                          //   child: Container(
                                          //     height: height / 19,
                                          //     width: width / 4,
                                          //     child: const Center(
                                          //       child: Text(
                                          //         "Live Trade",
                                          //         // style: TextStyle(
                                          //         //     fontFamily: 'Gilroy Medium',
                                          //         //     fontSize: 15),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(const BuyStock());
                      },
                      child: bu_sell_button(
                          "Sell", notifier.getwihitecolor,
                          notifier.getbluecolor),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const BuyStock());
                      },
                      child: bu_sell_button(
                          "Buy", notifier.getbluecolor,
                          notifier.getwihitecolor),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
