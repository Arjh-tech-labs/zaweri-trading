import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/bottom_bar/bottom_pages/stock_exchange_tabs/buy.dart';
import 'package:Zaveri/bottom_bar/bottom_pages/stock_exchange_tabs/sell.dart';

import '../../Custom_BlocObserver/notifire_clor.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class Stock_Exchange extends StatefulWidget {
  const Stock_Exchange({Key? key}) : super(key: key);

  @override
  State<Stock_Exchange> createState() => _Stock_ExchangeState();
}

class _Stock_ExchangeState extends State<Stock_Exchange>
    with SingleTickerProviderStateMixin {
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
        Text("Buy", style: TextStyle(color: Colors.black))
      ],
    ),
    Row(
      children: const [
        Tab(
          icon: Icon(Icons.local_activity, color: Colors.white),
        ),
        SizedBox(width: 4),
        Text("Sell", style: TextStyle(color: Colors.white))
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
          appBar: CustomAppBar(
              notifier.getwihitecolor, "Exchange", notifier.getblck,
              height: height / 15),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height / 50),
                Container(
                  height: height,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
                    child: Column(
                      children: [
                        Container(
                          height: height / 17,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                          ),
                          child: TabBar(
                            unselectedLabelStyle:
                            TextStyle(color: notifier.getblck),
                            controller: _tabController,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  25.0,
                                ),
                                color: Colors.transparent),
                            labelColor: notifier.getblck,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Tab(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Buy",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Tab(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sell",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: const [buy(), sell()],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
