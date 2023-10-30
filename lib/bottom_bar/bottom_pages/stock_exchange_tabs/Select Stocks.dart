import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/bottom_bar/bottom_pages/stock_exchange_tabs/Buy%20Stock.dart';
import '../../../Custom_BlocObserver/custtom_slock_list/custtom_slock_list.dart';
import '../../../Custom_BlocObserver/custtom_textfild/consttom_textfild.dart';
import '../../../utils/medeiaqury/medeiaqury.dart';

class SelectStocks extends StatefulWidget {
  const SelectStocks({Key? key}) : super(key: key);

  @override
  State<SelectStocks> createState() => _SelectStocksState();
}

class _SelectStocksState extends State<SelectStocks> {

  late ColorNotifier notifier;
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: notifier.getwihitecolor,
      appBar: CustomAppBar(notifier.getwihitecolor, "Select Stocks", notifier.getblck,height: height/15),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25,right: 25),
          child: Column(
            children: [
              SizedBox(height: height/15),
              Center(
                child: Customtextfild.textField(
                    "Search  company, stocks...",
                    notifier.getbluecolor,
                    Icons.search_rounded,
                    notifier.getgrey,notifier.getblck,notifier.getblck,notifier.getgrey),
              ),
            SizedBox(height: height/20),
            GestureDetector(
              onTap: () {
                Get.to(const BuyStock());
              },
              child: custtom_button(
                  "Airtel Bharti", "Airtel", "\₹127,00", "10,03%"),
            ),
              SizedBox(height: height/30),
              GestureDetector(
                onTap: () {
                  Get.to(const BuyStock());
                },
                child: custtom_button(
                    "Ambuja Cement", "Ambuja", "\₹297,64", "2,87%"),
              ),
              SizedBox(height: height/30),
              GestureDetector(
                onTap: () {
                  Get.to(const BuyStock());
                },
                child: custtom_button(
                    "Kotak Bank", "Kotak", "\₹26,23", "2,87%"),
              ),
              SizedBox(height: height/30),
              GestureDetector(
                onTap: () {
                  Get.to(const BuyStock());
                },
                child: custtom_button(
                    "icici bank", "icici", "\₹326,23", "2,87%"),
              ),
              SizedBox(height: height/30),
              GestureDetector(
                onTap: () {
                  Get.to(const BuyStock());
                },
                child: custtom_button(
                    "HDFC bank", "HDFC Inc.", "\₹252,12", "10,03%"),
              ),
              SizedBox(height: height/30),
              GestureDetector(
                onTap: () {
                  Get.to(const BuyStock());
                },
                child: custtom_button(
                    "icici bank", "icici", "\₹326,23", "2,87%"),
              ),
              SizedBox(height: height/30),
              GestureDetector(
                onTap: () {
                  Get.to(const BuyStock());
                },
                child: custtom_button(
                    "Ambuja Cement", "Ambuja", "\₹326,23", "2,87%"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
