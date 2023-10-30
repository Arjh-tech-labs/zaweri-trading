import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/utils/medeiaqury/medeiaqury.dart';

import '../stocks/controller/hist_controller.dart';

class oneday extends StatefulWidget {
  const oneday({Key? key}) : super(key: key);

  @override
  State<oneday> createState() => _onedayState();
}

class _onedayState extends State<oneday> {
  late ColorNotifier notifier;
  int touchedIndex = -1;
  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifier.setIsDark = false;
    } else {
      notifier.setIsDark = previusstate;
    }
  }

  final HistController histController = Get.find();
  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
    suraj();
  }

  List<double> allData = [];
  suraj() {
    List rawData = histController.fetchedHist;
// Extract values at index 1 to 4 and add them to the allData list
    for (var sublist in rawData) {
      if (sublist.length >= 5) {
        allData.addAll([
          sublist[1].toDouble(), // Index 1
          sublist[2].toDouble(), // Index 2
          sublist[3].toDouble(), // Index 3
          sublist[4].toDouble(), // Index 4
        ]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.getwihitecolor,
      body: Column(
        children: [
          Container(
            child: Sparkline(
              useCubicSmoothing: true,
              data: allData,
              lineWidth: 2.0,
              // fillMode: FillMode.below,
              // fillColor: Color(0xff9EA3AE)
            ),
            // child: LineChart(
            //   onedaymainData(notifier.getbluecolor, 0.1),
            // ),
          ),
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
    );
  }

  // LineChartData onedaymainData(color, opcity) {
  //   List<Color> gradientColors = [color];
  //   return LineChartData(
  //     gridData: FlGridData(
  //       show: false,
  //       drawVerticalLine: true,
  //       getDrawingHorizontalLine: (value) {
  //         return FlLine(strokeWidth: 1, color: Colors.transparent);
  //       },
  //       getDrawingVerticalLine: (value) {
  //         return FlLine(
  //           strokeWidth: 0,
  //         );
  //       },
  //     ),
  //     titlesData: FlTitlesData(
  //       show: false,
  //       leftTitles: AxisTitles(
  //         drawBelowEverything: false,
  //         axisNameSize: 20,
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //         show: true, border: Border.all(color: Colors.white, width: 0)),
  //     minX: 0,
  //     maxX: 8,
  //     minY: 0,
  //     maxY: 5,
  //     lineBarsData: [
  //       LineChartBarData(
  //         spots: [
  //           const FlSpot(0, 2.5),
  //           const FlSpot(1, 2),
  //           const FlSpot(2, 4),
  //           const FlSpot(3, 3.1),
  //           const FlSpot(4, 4),
  //           const FlSpot(5, 2),
  //           const FlSpot(6, 4),
  //           const FlSpot(7, 3.1),
  //           const FlSpot(8, 2),
  //           const FlSpot(9, 1.5),
  //           const FlSpot(10, 3),
  //           const FlSpot(11, 4),
  //           const FlSpot(12, 5),
  //           const FlSpot(13, 3),
  //         ],
  //         isCurved: true,
  //         // colors: gradientColors,
  //         barWidth: 2,
  //         isStrokeCapRound: false,
  //         dotData: FlDotData(
  //           show: false,
  //         ),
  //         belowBarData: BarAreaData(
  //           show: true,
  //           // colors: gradientColors
  //           //     .map((color) => color.withOpacity(opcity))
  //           //     .toList(),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
