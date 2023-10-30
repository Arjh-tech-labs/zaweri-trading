import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/medeiaqury/medeiaqury.dart';
import '../graph/graph.dart';
import '../notifire_clor.dart';

class Custtom_Stock_Gains_card extends StatefulWidget {
  @override
  State<Custtom_Stock_Gains_card> createState() =>
      _Custtom_Stock_Gains_cardState();
}

class _Custtom_Stock_Gains_cardState extends State<Custtom_Stock_Gains_card> {
  get borderRadius => BorderRadius.circular(15);

  bool showAvg = false;

  int touchedIndex = -1;
  late ColorNotifier notifier;
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
    String dropdownvalue = 'Today';
    var items = [
      'Today',
      'This Week',
      'This Month',
      'This year',
    ];
    return ScreenUtilInit(
      builder:  (_,child) {
        return Column(
          children: [
            Center(
              child: Container(
                height: height / 6.0,
                width: width / 1.1,
                child: Card(
                  color: notifier.getbluecolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: height / 80),
                      Padding(
                        padding:
                        EdgeInsets.only(left: width / 25, right: width / 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Stock Gains",
                              style: TextStyle(
                                  color: notifier.getwihitecolor,
                                  fontSize: 15.sp,
                                  fontFamily: 'Gilroy_Medium'),
                            ),
                            Stack(
                              children: [
                                Opacity(
                                  opacity: 0.15,
                                  child: Container(
                                    height: height / 20,
                                    width: width / 3.7,
                                    decoration: BoxDecoration(
                                      color: notifier.getwihitecolor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.sp),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: width / 26),
                                      child: DropdownButton(
                                        dropdownColor: notifier.getbluecolor,
                                        underline: const SizedBox(),
                                        value: dropdownvalue,
                                        icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: notifier.getwihitecolor,
                                            size: 17.sp),
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(
                                              items,
                                              style: TextStyle(
                                                  fontFamily: 'Gilroy_Medium',
                                                  color: notifier.getwihitecolor,
                                                  fontSize: 11.sp),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width / 25),
                        child: Row(
                          children: [
                            Text(
                              "\₹24,320+",
                              style: TextStyle(
                                  color: notifier.getwihitecolor,
                                  fontSize: 20.sp,
                                  fontFamily: 'Gilroy_Bold'),
                            ),
                          ],
                        ),
                      ),
                      // Expanded(
                      //   child: Container(
                      //     child: LineChart(
                      //       mainData(notifier.getwihitecolor, 0.5),
                      //     ),
                      //   ),
                      // ),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            touchedIndex = -1;
                          });
                        },
                        hoverColor: Colors.transparent,
                        onTap: () {},
                        child: Row(
                          children: const <Widget>[],
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
    );
  }
}
