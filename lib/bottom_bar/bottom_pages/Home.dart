import 'dart:math';

import 'package:Zaveri/bottom_bar/bottom_pages/screens/view_all_watchlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_stoc/Custtom_stoc.dart';
import 'package:Zaveri/Custom_BlocObserver/Stock%20Gains%20card/Stock_Gains_card.dart';
import 'package:Zaveri/Custom_BlocObserver/custtom_slock_list/custtom_slock_list.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../stocks/controller/hist_controller.dart';
import '../../stocks/controller/stock_details_controller.dart';
import '../../stocks/views/stock_search.dart';
import '../../utils/medeiaqury/medeiaqury.dart';
import '../Stock_Detail.dart';
import '../controller/favoritecontroller.dart';
import '../controller/portfolio_controller.dart';
import '../controller/top_stock_controller.dart';
import '../models/WishlistModel.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HistController histController = Get.put(HistController());
  final SurajController surajController = Get.find();
  final WishlistsController wishlistsController = Get.find();
  final StockController stockController = Get.find();
  final PortfolioController portfolioController = Get.find();
  final TopStockController topStockController = Get.find();

  late ColorNotifier notifier;

  int touchedIndex = -1;
  String name='';
  @override
  void initState(){
    super.initState();
    wishlistsController.favoriteApi();
    portfolioController.portfolioApi();
    topStockController.callTopStockApi();
    sharePref();
  }

  sharePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userid = prefs.getInt('userid')!;
    name = prefs.getString('f_name')!;
  }


  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(builder: (_, child) {
      return Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.sp),
            // here the desired height
            child: AppBar(
              elevation: 0,
              backgroundColor: notifier.getwihitecolor,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height / 70),
                  Text(
                    "Hello $name",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: notifier.getgrey,
                        fontFamily: 'Gilroy-Regular'),
                  ),
                  Text(
                    "Welcome to Zaveri",
                    style: TextStyle(
                        fontSize: 24.sp,
                        color: notifier.getblck,
                        fontFamily: 'Gilroy_Bold'),
                  ),
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        color: Colors.black12,
                      ),
                      child: IconButton(onPressed: (){
                        Get.to(StockListing());
                      }, icon: Image.asset("assets/images/search.png",color: Colors.blueAccent,height: 30,)),
                    ),
                    SizedBox(width: width / 25),
                  ],
                )
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Custtom_Stock_Gains_card(),

              //portfolio
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  children: [
                    Text(
                      "Portfolio",
                      style: TextStyle(
                          color: notifier.getblck,
                          fontSize: 18.sp,
                          fontFamily: 'Gilroy_Bold'),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Get.to(const SelectStocks());
                    //   },
                    //   child: Text(
                    //     "View all",
                    //     style: TextStyle(
                    //         color: notifier.getbluecolor,
                    //         fontSize: 12.sp,
                    //         fontFamily: 'Gilroy_Medium'),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                height: height / 8,
                child: GetBuilder<PortfolioController>(
                    builder: (portfolioController) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: portfolioController.portfolioStock.length,
                    itemBuilder: (context, index) {
                      final portfolio =
                          portfolioController.portfolioStock[index];
                      final sendExchange = portfolio['exchange'].toString();
                      final sendToken = portfolio['symbolToken'].toString();
                      return GestureDetector(
                        onTap: () {
                          stockController.calEverySec(
                              exchange: sendExchange, token: sendToken);
                          histController.histData(
                              exchange: sendExchange, token: sendToken);
                          Get.to(Stock_Detail());
                        },
                        child: Custtom_stoc(
                          "${portfolio['tradingSymbol']}",
                          "${portfolio['exchange']}",
                          "\₹${portfolio['ltp']}",
                          "${portfolio['percentChange']}%",
                          const Color(0xffFC6C6B),
                        ),
                      );
                    },
                  );
                }),
              ),

              //watchlist
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Watchlist",
                      style: TextStyle(
                          color: notifier.getblck,
                          fontSize: 18.sp,
                          fontFamily: 'Gilroy_Bold'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(AllWatchList());
                      },
                      child: Text(
                        "View all",
                        style: TextStyle(
                            color: notifier.getbluecolor,
                            fontSize: 15.sp,
                            fontFamily: 'Gilroy_Medium'),
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<SurajController>(builder: (surajController) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: min(surajController.suraj.length, 5),
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

              //Top Stocks
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: Row(
                  children: [
                    Text(
                      "Top Stocks",
                      style: TextStyle(
                          color: notifier.getblck,
                          fontSize: 18.sp,
                          fontFamily: 'Gilroy_Bold'),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Get.to(const SelectStocks());
                    //   },
                    //   child: Text(
                    //     "View all",
                    //     style: TextStyle(
                    //         color: notifier.getbluecolor,
                    //         fontSize: 12.sp,
                    //         fontFamily: 'Gilroy_Medium'),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                height: height / 8,
                child: GetBuilder<TopStockController>(
                    builder: (topStockController) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: topStockController.fetchedTopStock.length,
                    itemBuilder: (context, index) {
                      final topStock =
                          topStockController.fetchedTopStock[index];
                      final sendExchange = topStock['exchange'].toString();
                      final sendToken = topStock['symbolToken'].toString();
                      return GestureDetector(
                        onTap: () {
                          stockController.calEverySec(
                              exchange: sendExchange, token: sendToken);
                          histController.histData(
                              exchange: sendExchange, token: sendToken);
                          Get.to(Stock_Detail());
                        },
                        child: Custtom_stoc(
                          "${topStock['tradingSymbol']}",
                          "${topStock['exchange']}",
                          "\₹${topStock['ltp']}",
                          "${topStock['percentChange']}%",
                          const Color(0xffFC6C6B),
                        ),
                      );
                    },
                  );
                }),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      );
    });
  }
}
