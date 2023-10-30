import 'package:buttons_tabbar/buttons_tabbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Custom_BlocObserver/notifire_clor.dart';
import '../graph_tabs/1D.dart';
import '../graph_tabs/1M.dart';
import '../graph_tabs/1W.dart';
import '../graph_tabs/1Y.dart';
import '../graph_tabs/5Y.dart';
import '../utils/medeiaqury/medeiaqury.dart';

class Summary extends StatefulWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  late ColorNotifier notifier;
  int selectedindex = -1;
  int touchedIndex = -1;
  List chart_duration = ["1D", "1W", "1Y", "5Y"];
  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifier.setIsDark = false;
    } else {
      notifier.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: height / 50),
          Row(
            children: [
              SizedBox(width: width / 20),
              Image.asset("assets/images/paypal.png", height: height / 30),
              Text(
                "PYPL",
                style: TextStyle(
                    fontFamily: 'Gilroy_Bold',
                    fontSize: 12.sp,
                    color: notifier.getblck),
              ),
              SizedBox(width: width / 100),
              Text(
                "PayPal Inc.",
                style: TextStyle(
                    fontFamily: 'Gilroy_Bold',
                    fontSize: 12.sp,
                    color: notifier.getgrey),
              ),
            ],
          ),
          SizedBox(height: height / 70),
          Row(
            children: [
              SizedBox(width: width / 20),
              Text(
                "\₹326,23",
                style: TextStyle(
                    color: notifier.getblck,
                    fontFamily: 'Gilroy_Bold',
                    fontSize: 27.sp),
              ),
            ],
          ),
          SizedBox(height: height / 200),
          Row(
            children: [
              SizedBox(width: width / 25),
              const Icon(
                Icons.arrow_drop_up_outlined,
                color: Color(0xff19C09A),
              ),
              Text(
                "65.63 (76,23%)",
                style: TextStyle(
                    color: const Color(0xff19C09A),
                    fontSize: 12.sp,
                    fontFamily: 'Gilroy_Bold'),
              ),
              SizedBox(width: width / 100),
              Text(
                "Today",
                style: TextStyle(
                    color: notifier.getgrey,
                    fontSize: 12.sp,
                    fontFamily: 'Gilroy_Bold'),
              ),
            ],
          ),
          Container(
            height: width / 1.5,
            width: 320.w,
            child: DefaultTabController(
              length: 5,
              child: Column(
                children: <Widget>[
                  ButtonsTabBar(
                    backgroundColor: Color(0xff6A94B4FF),
                    unselectedBackgroundColor: const Color(0xffeff6ff),
                    unselectedLabelStyle: const TextStyle(color: Colors.black),
                    labelStyle: const TextStyle(
                        color: Colors.green, fontFamily: 'Gilroy_Bold'),
                    tabs: [
                      Tab(
                        child: Container(
                          height: height / 19,
                          width: width / 8,
                          decoration: const BoxDecoration(
                            // border: Border.all(color: const Color(0xff8f94b0)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "1D",
                              style: TextStyle(
                                  fontFamily: 'Gilroy_Bold', fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: height / 19,
                          width: width / 8,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "1W",
                              style: TextStyle(
                                  fontFamily: 'Gilroy_Bold', fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: height / 19,
                          width: width / 8,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "1M",
                              style: TextStyle(
                                  fontFamily: 'Gilroy_Bold', fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: height / 19,
                          width: width / 8,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                "1Y",
                                style: TextStyle(
                                    fontFamily: 'Gilroy_Bold', fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: height / 19,
                          width: width / 8,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "5Y",
                              style: TextStyle(
                                  fontFamily: 'Gilroy_Bold', fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        // oneday(),
                        // oneweek(),
                        // onemonth(),
                        // oneyear(),
                        // fiveyear(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // child: ListView.builder(
            //   itemCount: chart_duration.length,
            //   scrollDirection: Axis.horizontal,
            //   itemBuilder:  (context, index) {
            //   return GestureDetector(
            //     onTap: () {
            //       setState(() {
            //         selectedindex = index;
            //       });
            //     },
            //     child: Row(
            //       children: [
            //         Container(
            //           width: 60.w,
            //           decoration: BoxDecoration(
            //             color: selectedindex == index
            //                 ? notifier.getbluecolor
            //                 : Colors.transparent,
            //             border: Border.all(
            //               color: Colors.grey,
            //             ),
            //             borderRadius: BorderRadius.all(
            //               Radius.circular(10.sp),
            //             ),
            //           ),
            //           child: Center(
            //             child: Text(
            //               chart_duration[index],
            //               style: TextStyle(
            //                   fontFamily: 'Gilroy_Bold',
            //                   color: selectedindex == index
            //                       ? Colors.white
            //                       : notifier.getbluecolor,
            //                   fontWeight: FontWeight.normal,
            //                   fontSize: 12.sp),
            //             ),
            //           ),
            //         ),
            //         SizedBox(width: 20.w)
            //       ],
            //     ),
            //   );
            // },),
          ),
          // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //
          //     Cart_type("1D"),
          //     Cart_type("1W"),
          //     Cart_type("1M"),
          //     Cart_type("1Y"),
          //     Cart_type("5Y"),
          //   ],
          // ),

          SizedBox(height: height / 70),
          Row(
            children: [
              SizedBox(width: width / 20),
              Text(
                "Statistics",
                style: TextStyle(
                    color: notifier.getblck,
                    fontFamily: 'Gilroy_Bold',
                    fontSize: 20.sp),
              ),
            ],
          ),
          SizedBox(height: height / 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Statistics_text("Open", notifier.getgrey),
                  Statistics_text("Low", notifier.getgrey),
                  Statistics_text("High", notifier.getgrey),
                ],
              ),
              // SizedBox(width: w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Statistics_text("160.32", notifier.getblck),
                  Statistics_text("168.36", notifier.getblck),
                  Statistics_text("168.36", notifier.getblck),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Statistics_text("Volume", notifier.getgrey),
                  Statistics_text("Avg. Vol", notifier.getgrey),
                  Statistics_text("Market", notifier.getgrey),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Statistics_text("160.32", notifier.getblck),
                  Statistics_text("168.36", notifier.getblck),
                  Statistics_text("168.36", notifier.getblck),
                ],
              ),
            ],
          ),
          SizedBox(height: height / 200),
        ],
      ),
    );
  }

  Widget Cart_type(txt) {
    return Container(
      height: 35.h,
      width: 45.w,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(12.sp))),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
              fontSize: 15.sp, fontFamily: 'Gilroy_Bold', color: Colors.white),
        ),
      ),
    );
  }

  Widget Statistics_text(text, color) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontFamily: 'Gilroy_Bold', fontSize: 13.sp),
    );
  }
}
