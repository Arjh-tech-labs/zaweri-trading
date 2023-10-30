import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../Custom_BlocObserver/Custtom_app_bar/newCustom_appBar.dart';
import '../../Custom_BlocObserver/Custtom_stoc/Custtom_stoc.dart';
import '../../Custom_BlocObserver/custtom_slock_list/custtom_slock_list.dart';
import '../../stocks/controller/hist_controller.dart';
import '../../stocks/controller/stock_details_controller.dart';
import '../../utils/medeiaqury/medeiaqury.dart';
import '../Stock_Detail.dart';
import '../controller/portfolio_controller.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  late ColorNotifier notifier;

  final PortfolioController portfolioController = Get.find();
  final StockController stockController = Get.find();
  final HistController histController = Get.put(HistController());

  // late List<GDPData> _chartData;
  // late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    // _chartData = getChartData();
    // _tooltipBehavior = TooltipBehavior(enable: true);
    portfolioController.portfolioApi();
    super.initState();
  }

  List<ChartData> chartData = [
    const ChartData('IND', 24),
    const ChartData('AUS', 20),
    const ChartData('USA', 27),
    const ChartData('DEU', 57),
    const ChartData('ITA', 30),
    const ChartData('UK', 41),
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
          appBar: NewCustomAppBar(
              notifier.getwihitecolor, "Portfolio", notifier.getblck,
              height: height / 15),
          body: Column(
            children: [
              // SizedBox(height: height / 40),
              // Row(
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         Get.to(const Stock_Detail());
              //       },
              //       child: up_down_rate("assets/images/Today_Gains.png",
              //           "\₹2,209", "Today Gains"),
              //     ),
              //     const Spacer(),
              //     GestureDetector(
              //       onTap: () {
              //         Get.to(const Stock_Detail());
              //       },
              //       child: up_down_rate("assets/images/Overall Loss.png",
              //           "\₹5,440", "Overall Loss"),
              //     ),
              //     SizedBox(width: width / 15),
              //   ],
              // ),
              // SizedBox(height: height / 25),
              // Row(
              //   children: [
              //     SizedBox(width: width / 20),
              //     Text(
              //       "Portfolio Balance",
              //       style: TextStyle(
              //           fontSize: 14.sp,
              //           color: notifier.getgrey,
              //           fontFamily: 'Gilroy_Medium'),
              //     ),
              //     const Spacer(),
              //     Image.asset("assets/images/ball.png", height: height / 20),
              //     SizedBox(width: width / 15),
              //   ],
              // ),
              // SizedBox(height: height / 200),
              // Row(
              //   children: [
              //     SizedBox(width: width / 20),
              //     Text(
              //       "\₹97,326.46",
              //       style: TextStyle(
              //           color: notifier.getblck,
              //           fontFamily: 'Gilroy_Bold',
              //           fontSize: 27.sp),
              //     ),
              //   ],
              // ),
              // SizedBox(height: height / 200),
              // Row(
              //   children: [
              //     SizedBox(width: width / 25),
              //     const Icon(
              //       Icons.arrow_drop_up_outlined,
              //       color: Color(0xff19C09A),
              //     ),
              //     Text(
              //       "65.63 (76,23%)",
              //       style: TextStyle(
              //           color: const Color(0xff19C09A),
              //           fontSize: 12.sp,
              //           fontFamily: 'Gilroy_Bold'),
              //     ),
              //     SizedBox(width: width / 100),
              //     Text(
              //       "Today",
              //       style: TextStyle(
              //           color: notifier.getgrey,
              //           fontSize: 12.sp,
              //           fontFamily: 'Gilroy_Bold'),
              //     ),
              //   ],
              // ),
              SizedBox(height: height / 50),
              Expanded(
                child: ListView.separated(
                  itemCount: portfolioController.portfolioStock.length,
                  itemBuilder: (context, index) {
                    final portfolio =
                    portfolioController.portfolioStock[index];
                    final sendExchange = portfolio['exchange'].toString();
                    final sendToken = portfolio['symbolToken'].toString();
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            stockController.calEverySec(
                                exchange: sendExchange, token: sendToken);
                            histController.histData(
                                exchange: sendExchange, token: sendToken);
                            Get.to(Stock_Detail());
                          },
                          child: custtom_button(
                              "${portfolio['tradingSymbol']}", "${portfolio['exchange']}", "\₹${portfolio['ltp']}", "${portfolio['percentChange']}%"),
                        ),
                      ],
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                    return Divider( thickness: 0.5,);
                },
                ),
              ),

            ],
          ),
        );
      },
    );
  }

  Widget column_chart() {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(interval: 1),
        annotations: const <CartesianChartAnnotation>[
          CartesianChartAnnotation(
              coordinateUnit: CoordinateUnit.percentage,
              region: AnnotationRegion.plotArea,
              widget: Text('',
                  style: TextStyle(
                    fontSize: 14,
                  )),
              x: '50%',
              y: '50%')
        ],
        series: <ChartSeries<ChartData, String>>[
          ColumnSeries<ChartData, String>(
              color: notifier.getbluecolor,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]);
  }

  Widget up_down_rate(image, rate, days) {
    return Container(
      color: notifier.getwihitecolor,
      height: height / 12,
      width: width / 2.2,
      child: Card(
        color: notifier.getwihitecolor,
        elevation: 1,
        child: Row(
          children: [
            SizedBox(width: width / 20),
            Image.asset(
              image,
              height: height / 17,
            ),
            SizedBox(width: width / 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height / 100),
                Text(
                  rate,
                  style: TextStyle(
                    color: notifier.getblck,
                    fontSize: 17.sp,
                    fontFamily: 'Gilroy_Bold',
                  ),
                ),
                Text(
                  days,
                  style: TextStyle(
                    color: notifier.getgrey,
                    fontSize: 13.sp,
                    fontFamily: 'Gilroy_Medium',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  const ChartData(this.x, this.y);

  final String x;
  final int y;
}
