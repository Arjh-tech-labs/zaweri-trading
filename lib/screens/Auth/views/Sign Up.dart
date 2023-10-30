import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:Zaveri/screens/Auth/views/Login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/button/custtom_button.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import '../../../utils/medeiaqury/medeiaqury.dart';
import '../controller/signup_controller.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final SignUpApiController signUpApiController =
      Get.put(SignUpApiController());

  late bool checkBox = false;
  bool hidePassword = true;
  late ColorNotifier notifier;
  bool isChecked = false;
  // bool loading = false;

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
    return ScreenUtilInit(builder: (_, child) {
      return Scaffold(
        backgroundColor: notifier.getwihitecolor,
        appBar: CustomAppBar(notifier.getwihitecolor, "", notifier.getblck,
            height: height / 15),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                    color: notifier.getblck,
                    fontSize: 26.sp,
                    fontFamily: 'Gilroy_Bold'),
              ),
              SizedBox(height: height / 25),
              Text(
                "It only  takes a minute to create your\naccount",
                style: TextStyle(fontSize: 16.sp, color: notifier.getgrey),
              ),
              SizedBox(height: height / 30),
              Container(
                height: 45.h,
                width: 300.w,
                child: TextField(
                  controller: nameController,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    label: Text("Name"),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.blue),
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 30),
              Container(
                height: 45.h,
                width: 300.w,
                child: TextField(
                  controller: mobileController,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    print(value);
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                    counterText: "",
                    label: Text("Mobile number"),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    prefixIcon: Icon(Icons.call, color: Colors.blue),
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 30),
              Container(
                height: 45.h,
                width: 300.w,
                child: TextField(
                  controller: emailController,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    print(value);
                  },
                  // obscureText: hidePassword, //show/hide password
                  decoration: InputDecoration(
                    label: Text("Email Address"),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    prefixIcon: Icon(Icons.mail, color: Colors.blue),
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 30),
              Container(
                height: 45.h,
                width: 300.w,
                child: TextField(
                  controller: passController,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    print(value);
                  },
                  obscureText: hidePassword, //show/hide password
                  decoration: InputDecoration(
                    label: Text("Password"),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.blue),
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 30),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.sp,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.sp),
                        ),
                      ),
                      activeColor: notifier.getbluecolor,
                      side: BorderSide(color: notifier.getbluecolor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                          checkBox = value;
                        });
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "I agree to the Zaveri Trading ",
                            style: TextStyle(color: notifier.getblck),
                          ),
                          Text(
                            "Terms of Service ",
                            style: TextStyle(
                                fontFamily: 'Gilroy_Medium',
                                color: notifier.getbluecolor),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "and",
                            style: TextStyle(
                                fontFamily: 'Gilroy_Medium',
                                color: notifier.getblck),
                          ),
                          Text(
                            "  Privacy Policy",
                            style: TextStyle(
                                fontFamily: 'Gilroy_Medium',
                                color: notifier.getbluecolor),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    if (nameController.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: 'Name is required',
                        backgroundColor: Colors.black,
                      );
                    } else if (mobileController.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: 'Mobile number is required',
                        backgroundColor: Colors.black,
                      );
                    } else if (emailController.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: 'Email address is required',
                        backgroundColor: Colors.black,
                      );
                    } else if (passController.text.isEmpty) {
                      Fluttertoast.showToast(
                        msg: 'Password is required',
                        backgroundColor: Colors.black,
                      );
                    } else if (checkBox == false) {
                      Fluttertoast.showToast(
                        msg: 'Please checked Privacy Policy',
                        backgroundColor: Colors.black,
                      );
                    } else {
                      signUpApiController.signUpApi(
                          name: nameController.text,
                          email: emailController.text,
                          phone: mobileController.text,
                          pass: passController.text);

                      setState(() {
                        // show();
                        signUpApiController.loading.value = true;
                      });
                    }
                  },
                  child: Obx(() => signUpApiController.loading.value
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : button("Create account", notifier.getbluecolor,
                      notifier.getwihitecolor))),
              SizedBox(height: height / 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have a account?",
                    style: TextStyle(
                        color: notifier.getgrey,
                        fontSize: 15.sp,
                        fontFamily: 'Gilroy_Medium'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(Login());
                    },
                    child: Text(
                      " Sign in",
                      style: TextStyle(
                          color: notifier.getbluecolor,
                          fontSize: 15.sp,
                          fontFamily: 'Gilroy_Bold'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
