import 'package:flutter/material.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/bottom_bar/bottom_pages/Home.dart';
import 'package:Zaveri/bottom_bar/bottom_pages/Order.dart';
import 'package:Zaveri/bottom_bar/bottom_pages/Portfolio.dart';
import 'package:Zaveri/bottom_bar/bottom_pages/Profile.dart';
import 'package:Zaveri/bottom_bar/bottom_pages/Stock_Exchange.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Controller/order_controller.dart';
import '../Controller/wallet_controller.dart';
import '../screens/profile/controller/profile_controller.dart';
import '../stocks/controller/hist_controller.dart';
import '../stocks/controller/stock_details_controller.dart';
import '../utils/medeiaqury/medeiaqury.dart';
import 'controller/favoritecontroller.dart';
import 'controller/portfolio_controller.dart';
import 'controller/top_stock_controller.dart';
import 'models/WishlistModel.dart';

class BottomNavBar extends StatefulWidget {
  final int? currentIndex;
  BottomNavBar({Key? key, this.currentIndex}) : super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final ProfileController profileController = Get.put(ProfileController());
  final StockController stockController = Get.put(StockController());
  final HistController histController = Get.put(HistController());
  final WishlistsController wishlistsController = Get.put(WishlistsController());
  final PortfolioController portfolioController = Get.put(PortfolioController());
  final TopStockController topStockController  = Get.put(TopStockController());
  final SurajController surajController = Get.put(SurajController());
  final WalletController walletController = Get.put(WalletController());
  final OrderController orderController = Get.put(OrderController());





  int _selectedIndex = 0;
  ColorNotifier? notifire;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex ?? 0;
    profileController.UserUpdateAPI();
    walletController.WalletAPI();
  }

  bool isPressed = false;
  final screen = [
    const Home(),
    const Portfolio(),
    const Stock_Exchange(),
    const Order(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: notifire?.getwihitecolor,
        unselectedItemColor: notifire?.getgrey.withOpacity(.80),
        selectedLabelStyle: const TextStyle(fontFamily: 'Gilroy_Medium'),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: notifire?.getbluecolor,
        selectedIconTheme: IconThemeData(color: notifire?.getbluecolor),
        unselectedLabelStyle: const TextStyle(fontFamily: 'Gilroy_Medium'),
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              // backgroundColor: notifire.getwihitecolor,
              icon: Image.asset("assets/images/Home-Filled.png",
                  height: height / 30),
              label: 'Home'),
          BottomNavigationBarItem(
              // backgroundColor: notifire.getwihitecolor,
              icon: Image.asset("assets/images/Portfolio-outline.png",
                  height: height / 30),
              label: 'Portfolio'),
          BottomNavigationBarItem(
              // backgroundColor: notifire.getwihitecolor,
              icon: Image.asset("assets/images/exchange.png",
                  height: height / 20),
              label: ''),
          BottomNavigationBarItem(
              backgroundColor: notifire?.getwihitecolor,
              icon: Image.asset("assets/images/Order-outline.png",
                  height: height / 30),
              label: 'Order'),
          BottomNavigationBarItem(
            backgroundColor: notifire?.getwihitecolor,
            icon: Image.asset("assets/images/User-outline.png",
                height: height / 30),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            // isPressed = true;
          });
        },
      ),
      body: screen[_selectedIndex],
      // Stack(
      //   children: [
      //     _buildOffstageNavigator(0),
      //     _buildOffstageNavigator(1),
      //     _buildOffstageNavigator(2),
      //     _buildOffstageNavigator(3),
      //     _buildOffstageNavigator(4),
      //   ],
      // ),
    );
  }
}
