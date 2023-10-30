import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart' as dioFormData;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/button/custtom_button.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bottom_bar/bottom_pages/Profile.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  // bool hidePassword = true;
  late ColorNotifier notifier;
  String ImageUrl = "https://zaveritrading.com/public/storage/image/";
  String img = "";
  bool loading = true;
  int ImgStatus = 1;
  File? _imageFile;
  late SharedPreferences prefs;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifier.setIsDark = false;
    } else {
      notifier.setIsDark = previusstate;
    }
  }


  SharePref()async{
    prefs = await SharedPreferences.getInstance();
  }

  Future<String?> getPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userid = prefs.getInt('userid')!;
    String token = prefs.getString('barrierToken')!;
    ProfileAPI(userid, token);
    SharePref();
  }

  Future<String?> getPreference1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userid = prefs.getInt('userid')!;
    String token = prefs.getString('barrierToken')!;
    ProfileAPI1(userid, token);
    SharePref();
  }

  @override
  void initState() {
    super.initState();
    getPreference();
    getPreference1();
    getdarkmodepreviousstate();
    image();
    // loading = !loading;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        ImgStatus = 4;
        _imageFile = File(pickedFile.path);
      });
    }
  }


  image() {
    if (ImgStatus == 1) {
      return Image.asset("assets/images/profile.png", height: height / 6);
    } else if (ImgStatus == 2) {
      return ClipOval(
          child: CachedNetworkImage(
            imageUrl: ImageUrl + img,height: height / 6, width: width / 3,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
      );
    } else if (ImgStatus == 4) {
      return ClipOval(
          child: Image.file(_imageFile!,
              height: height / 6, width: width / 3, fit: BoxFit.cover));
    }
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: notifier.getwihitecolor,
      appBar: CustomAppBar(
          notifier.getwihitecolor, "My Account", notifier.getblck,
          height: height / 15),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 25),
            Center(
              child: Stack(
                children: [
                  image(),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 8.9, left: width / 4.8),
                    child: InkWell(
                      onTap: () {
                        _pickImage();
                      },
                      child: Image.asset("assets/images/Camera.png", height: height / 18),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height / 30),
            Container(
              height: 45.h,
              width: 300.w,
              child: TextField(
                controller: nameController,
                readOnly: true,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                },
                decoration: InputDecoration(
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
            SizedBox(height: height / 40),
            Container(
              height: 45.h,
              width: 300.w,
              child: TextField(
                controller: emailController,
                readOnly: true,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                },
                decoration: InputDecoration(
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
            SizedBox(height: height / 40),
            Container(
              height: 45.h,
              width: 300.w,
              child: TextField(
                controller: mobileController,
                readOnly: true,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
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
            SizedBox(height: height / 5.5),
            loading?Center(
              child: CircularProgressIndicator(),
            ):Text(''),
            SizedBox(height: 20,),
            GestureDetector(
                onTap: () {
                  getPreference();
                  SharePref();
                  setState(() {
                    loading = true;
                  });
                },
                child: button("Save Changes", notifier.getbluecolor, notifier.getwihitecolor))
          ],
        ),
      ),
    );
  }

  ProfileAPI(int userid, String token) async {
    var headers = {'Authorization': token};
    dioFormData.FormData formData = dioFormData.FormData.fromMap({
      'user_id': userid,
      'image': [
        await MultipartFile.fromFile(_imageFile!.path,
            filename: _imageFile!.path)
      ]
    });
    var dio = Dio();
    var response = await dio.request(
      'https://zaveritrading.com/api/user/update/$userid',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: formData,
    );
    if (response.statusCode == 200) {
      setState(() {
        loading = false;
      });
      String responseString = jsonEncode(response.data);
      Map<String, dynamic> jsonResponse = json.decode(responseString);
      int status = jsonResponse['status'];
      if (status == 1) {
        Fluttertoast.showToast(
          msg: 'Data Saved Successfully',
          backgroundColor: Colors.black,
        );
        Map<String, dynamic> data = jsonResponse['data'];
        String email = data['email'];
        String f_name = data['f_name'];
        String phone = data['phone'].toString();
        String image = data['image'];
        prefs.setString('f_name', f_name);
        prefs.setString('email', email);
        prefs.setString('image', image);

        setState(() {
          emailController.text = email;
          nameController.text = f_name;
          mobileController.text = phone;
        });
        Get.off(Profile());

      } else {
        Fluttertoast.showToast(
          msg: 'Image type .jpg , .png ,',
          backgroundColor: Colors.black,
        );
        setState(() {
          loading = false;
        });
      }
    } else {
    }
  }

  ProfileAPI1(int userid, String token) async {
    var headers = {'Authorization': token};
    dioFormData.FormData formData = dioFormData.FormData.fromMap({
      'user_id': userid,
    });
    var dio = Dio();
    var response = await dio.request(
      'https://zaveritrading.com/api/user/update/$userid',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: formData,
    );
    if (response.statusCode == 200) {
      setState(() {
        loading = false;
      });
      String responseString = jsonEncode(response.data);
      Map<String, dynamic> jsonResponse = json.decode(responseString);
      int status = jsonResponse['status'];
      if (status == 1) {
        Fluttertoast.showToast(
          msg: 'Fetched data Successfully',
          backgroundColor: Colors.black,
        );
        Map<String, dynamic> data = jsonResponse['data'];
        String email = data['email'];
        String f_name = data['f_name'];
        String img1 = data['image'];
        String phone = data['phone'].toString();
        prefs.setString('f_name', f_name);
        prefs.setString('email', email);
        prefs.setString('image', img1);
        setState(() {
          emailController.text = email;
          nameController.text = f_name;
          mobileController.text = phone;
          img = img1;
          ImgStatus = 2;
        });
      } else {
        setState(() {
          loading = false;
        });
        Fluttertoast.showToast(
          msg: 'server error',
          backgroundColor: Colors.black,
        );
      }
    } else {

    }
  }
}
