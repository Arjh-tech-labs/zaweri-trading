// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:Zaveri/Custom_BlocObserver/button/custtom_button.dart';
// import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
// import 'package:Zaveri/screens/Auth/Login.dart';
// import 'package:Zaveri/screens/page_view/onbonding_two.dart';
//
// import '../../utils/medeiaqury/medeiaqury.dart';
//
// class oneonbonding extends StatefulWidget {
//   const oneonbonding({Key? key}) : super(key: key);
//
//   @override
//   State<oneonbonding> createState() => _oneonbondingState();
// }
//
// class _oneonbondingState extends State<oneonbonding> {
//   late ColorNotifier notifier;
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
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//     return ScreenUtilInit(
//       builder: (_,child) {
//         return Scaffold(
//           backgroundColor: notifier.getwihitecolor,
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(height: height / 6),
//                 Image.asset("assets/images/manage.png"),
//                 SizedBox(height: height / 11),
//                 Text(
//                   "Your money. Your choice.",
//                   style: TextStyle(
//                       color: notifier.getblck,
//                       fontSize: 26.sp,
//                       fontFamily: 'Gilroy_Bold'),
//                 ),
//                 SizedBox(height: height / 50),
//                 Text(
//                   "Trusted by Millions of worldwirde.\nStart investing today.",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       color: notifier.getgrey,
//                       fontSize: 13.sp,
//                       fontFamily: 'Gilroy_Bold'),
//                 ),
//                 SizedBox(height: height / 12),
//                 GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const onbondingtwo(),
//                         ),
//                       );
//                     },
//                     child: button(
//                         "Next", notifier.getbluecolor,
//                         notifier.getwihitecolor)),
//                 GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const Login(),
//                         ),
//                       );
//                     },
//                     child: button("Sign In", notifier.getwihitecolor,
//                         notifier.getbluecolor)),
//               ],
//             ),
//           ),
//         );
//       }
//     );
//   }
// }
