import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../bottom_bar/Stock_Detail.dart';
import '../apis/add_fav.dart';
import '../controller/hist_controller.dart';
import '../controller/stock_details_controller.dart';
import '../controller/stock_search_controller.dart';

class StockListing extends StatefulWidget {
  const StockListing({Key? key}) : super(key: key);

  @override
  State<StockListing> createState() => _StockListingState();
}

class _StockListingState extends State<StockListing> {

  final TextEditingController searchName = TextEditingController();
  final StockSearchController stockSearchController =
      Get.put(StockSearchController());
  final StockController stockController = Get.find();
  final HistController histController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // List allItems = []; // Contains all your data
  // List filteredItems = []; // Contains filtered data
  //
  // void filterItems(String query) {
  //   filteredItems = allItems.where((item) {
  //     final name = item["name"].toLowerCase();
  //     final searchQuery = query.toLowerCase();
  //     return name.contains(searchQuery);
  //   }).toList();
  //   setState(() {});
  // }

  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        actionsIconTheme: IconThemeData(color: Colors.red),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Container(
          height: 45.h,
          // width: 300.w,
          child: TextField(
            controller: searchName,
            style: TextStyle(color: Colors.blue),
            onChanged: (value) {
              name = value;
            },
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
              stockSearchController.fetchFilteredStocks(filter: name);
            },
            // obscureText: hidePassword, //show/hide password
            decoration: InputDecoration(
              label: Text("Search Stock"),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.sp),
              ),
              prefixIcon: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_rounded)),
              suffixIcon: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    stockSearchController.fetchFilteredStocks(filter: name);
                  },
                  child: Icon(Icons.search, color: Colors.blue)),
              labelStyle: TextStyle(color: Colors.black26),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.sp),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black45, width: 1),
                borderRadius: BorderRadius.circular(15.sp),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 1),
                borderRadius: BorderRadius.circular(15.sp),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<StockSearchController>(builder: (stockSearchController) {
              return ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: stockSearchController
                    .fetchedStock.length, // Number of items in the list
                itemBuilder: (BuildContext context, int index) {
                  final stock = stockSearchController.fetchedStock[index];
                  final stockName = stock['name'].toString();
                  final stockExg = stock['exch_seg'].toString();
                  final stockToken = stock['token'].toString();
                  final wishlistStatus = stock['wishlists_status'];
                  return ListTile(
                    onTap: () {
                      stockController.calEverySec(
                          exchange: stockExg, token: stockToken);
                      histController.histData(
                          exchange: stockExg, token: stockToken);
                      Get.to(Stock_Detail());
                    },
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search),
                    ),
                    title: Text(stockName), // Replace with your item content
                    subtitle: Text(stockExg),
                    trailing: IconButton(
                        onPressed: () {
                          AddFav(
                            stockSymbol: stockName,
                            stockToken: stockToken,
                            marketType: stockExg,
                            filterName: searchName.text
                          );

                        },
                        icon: wishlistStatus == 0
                            ? Icon(Icons.bookmark_border)
                            : Icon(
                                Icons.bookmark_added,
                                color: Colors.blue,
                              )),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 0,
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
