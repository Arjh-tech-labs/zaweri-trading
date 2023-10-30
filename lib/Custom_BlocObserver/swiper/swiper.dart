// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
// import 'package:Zaveri/screens/page_view/onbonding_two.dart';
// import 'package:Zaveri/screens/page_view/one_onbonding.dart';
//
// class swiper extends StatefulWidget {
//   @override
//   State<swiper> createState() => _swiperState();
// }
//
// class _swiperState extends State<swiper> {
//   late ColorNotifier notifier;
//   final controller = PageController(initialPage: 0);
//   getdarkmodepreviousstate() async {
//     final prefs = await SharedPreferences.getInstance();
//     bool? previusstate = prefs.getBool("setIsDark");
//     if (previusstate == null) {
//       notifier.setIsDark = false;
//     } else {
//       notifier.setIsDark = previusstate;
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getdarkmodepreviousstate();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     notifier = Provider.of<ColorNotifier>(context, listen: true);
//     return Scaffold(
//       body: Center(
//           child: PageView(
//         scrollDirection: Axis.horizontal,
//         controller: controller,
//         children: const <Widget>[
//           // oneonbonding(),
//           onbondingtwo(),
//         ],
//       )),
//     );
//   }
// }
