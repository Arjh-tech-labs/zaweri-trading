import 'package:Zaveri/const/api_string.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/screens/Payment%20Method/choice_payment.dart';
import 'package:Zaveri/screens/profile/FAQ.dart';
import 'package:Zaveri/screens/profile/Message%20Support.dart';
import 'package:Zaveri/screens/profile/My%20Account.dart';
import 'package:Zaveri/screens/profile/Settings.dart';
import 'package:provider/provider.dart';
import '../../screens/profile/controller/profile_controller.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final ProfileController profileController = Get.find();

  late ColorNotifier notifier;
  int price = 0;
  // String Name = "";
  // String Email = "";
  // String Img = "";
  // String ImageUrl = "https://zaveritrading.com/public/storage/image/";
  //
  // Future<String?> getPreference() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   int userid = prefs.getInt('userid')!;
  //   String token = prefs.getString('barrierToken')!;
  //   String name1 = prefs.getString('f_name')!;
  //   String email = prefs.getString('email')!;
  //   String image = prefs.getString('image')!;
  //   Name = name1;
  //   Email = email;
  //   Img = image;
  //   WalletAPI(userid, token);
  // }

  // WalletAPI(int userid, String token) async {
  //   var headers = {'Authorization': token};
  //   var dio = Dio();
  //   var response = await dio.request(
  //     'https://zaveritrading.com/api/user/fetchWallet/$userid',
  //     options: Options(
  //       method: 'GET',
  //       headers: headers,
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     String responseString = jsonEncode(response.data);
  //     Map<String, dynamic> jsonResponse = json.decode(responseString);
  //     int status = jsonResponse['status'];
  //     if (status == 1) {
  //       Fluttertoast.showToast(
  //         msg: 'Fetched data Successfully',
  //         backgroundColor: Colors.black,
  //       );
  //       Map<String, dynamic> data = jsonResponse['wallet'];
  //       price = data['balance'];
  //       setState(() {});
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: '',
  //         backgroundColor: Colors.black,
  //       );
  //     }
  //   } else {}
  // }

  @override
  void initState() {
    super.initState();
    // getPreference();
    profileController.postData();
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      builder: (_, child) {
        return Scaffold(
          backgroundColor: notifier.getwihitecolor,
          appBar: CustomAppBar(
              notifier.getwihitecolor, "Profile", notifier.getblck,
              height: height / 15),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _profile(),
                // SizedBox(height: height / 20),
                // GestureDetector(
                //     onTap: () {
                //       Get.to(const ReferralCode());
                //     },
                //     child: referal_code()),
                SizedBox(height: height / 25),
                GestureDetector(
                  onTap: () {
                    Get.to(const choice_payment());
                  },
                  child: itemList("assets/images/BillingPayment.png",
                      "Add Money", "₹$price"),
                ),
                SizedBox(height: height / 30),
                // GestureDetector(
                //   onTap: () {
                //     // Get.to(const choice_payment());
                //   },
                //   child: iteam_list(
                //       "assets/images/BillingPayment.png", "", "Bank Details"),
                // ),
                // SizedBox(height: height / 30),
                // GestureDetector(
                //     onTap: () {
                //       Get.to(  Language());
                //     },
                //     child: iteam_list(
                //         "assets/images/Language.png", "English", "Language")),
                // SizedBox(height: height / 30),
                GestureDetector(
                    onTap: () {
                      Get.to(const Settings());
                    },
                    child: itemList(
                        "assets/images/Settings.png", "", "Settings")),
                SizedBox(height: height / 30),
                GestureDetector(
                    onTap: () {
                      Get.to(const FAQ());
                    },
                    child: itemList("assets/images/FAQ.png", "", "FAQ")),
                SizedBox(height: height / 20),
                GestureDetector(
                  onTap: () {
                    Get.to(const MessageSupport());
                  },
                  child: support(
                      notifier.getbluecolor,
                      "We’d love to hear your feedback!\nWe are always looking to improve.",
                      notifier.getwihitecolor),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget support(btnColor, btnText, btnTextColor) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LayoutBuilder(builder: (context, constraints) {
              return Container(
                height: height / 13,
                width: width / 1.1,
                decoration: BoxDecoration(
                  color: btnColor!,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/images/support.png",
                        height: height / 20),
                    Text(
                      btnText!,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Gilroy_Medium',
                          fontSize: 13.sp,
                          color: btnTextColor),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: notifier.getwihitecolor,
                    )
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
  Widget _profile() {
    return Row(
      children: [
        SizedBox(width: width / 20),
        Stack(
          children: [
            ClipOval(
              // child: CachedNetworkImage(
              //   imageUrl: imgUrl+profileController.profileDetails['image'],
              //   height: height / 14,
              //   width: width / 7,
              //   fit: BoxFit.cover,
              //   placeholder: (context, url) => CircularProgressIndicator(),
              //   errorWidget: (context, url, error) => Icon(Icons.error),
              // ),
            ),
            // Image.asset("assets/images/profile.png", height: height / 14),
            Padding(
              padding: EdgeInsets.only(top: height / 26, left: width / 12),
              child:
                  Image.asset("assets/images/Camera.png", height: height / 30),
            ),
          ],
        ),
        SizedBox(width: width / 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Suraj Yadav",
              style: TextStyle(
                  color: notifier.getblck,
                  fontSize: 15.sp,
                  fontFamily: 'Gilroy_Bold'),
            ),
            Text(
              "suraj@gmail.com",
              style: TextStyle(
                  color: notifier.getgrey,
                  fontSize: 12.sp,
                  fontFamily: 'Gilroy_Medium'),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Get.to(const MyAccount());
          },
          child: Text(
            "Edit",
            style: TextStyle(
                color: notifier.getbluecolor,
                fontFamily: 'Gilroy_Bold',
                fontSize: 15.sp),
          ),
        ),
        SizedBox(width: width / 17),
      ],
    );
  }
  // Widget referral_code() {
  //   return Container(
  //     color: Colors.transparent,
  //     child: Row(
  //       children: [
  //         SizedBox(width: width / 20),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "Referral Code",
  //               style: TextStyle(
  //                   color: notifier.getblck,
  //                   fontSize: 15.sp,
  //                   fontFamily: 'Gilroy_Bold'),
  //             ),
  //             Text(
  //               "Share your love and get \₹10 of free stocks",
  //               style: TextStyle(
  //                   color: notifier.getgrey,
  //                   fontSize: 12.sp,
  //                   fontFamily: 'Gilroy_Medium'),
  //             ),
  //           ],
  //         ),
  //         const Spacer(),
  //         Image.asset("assets/images/gift.png", height: height / 30),
  //         SizedBox(width: width / 20),
  //       ],
  //     ),
  //   );
  // }
  Widget itemList(image, txt, name) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          SizedBox(width: width / 25),
          Image.asset(image, height: height / 15),
          SizedBox(width: width / 40),
          Text(
            name,
            style: TextStyle(
                color: notifier.getblck,
                fontSize: 15.sp,
                fontFamily: 'Gilroy_Bold'),
          ),
          const Spacer(),
          Text(
            txt,
            style: TextStyle(
                color: notifier.getgrey,
                fontFamily: 'Gilroy_Medium',
                fontSize: 12.sp),
          ),
          SizedBox(width: width / 100),
          Icon(Icons.arrow_forward_ios, color: notifier.getgrey, size: 17.sp),
          SizedBox(width: width / 15),
        ],
      ),
    );
  }
}
