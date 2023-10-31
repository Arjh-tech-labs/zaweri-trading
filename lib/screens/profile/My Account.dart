import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Controller/wallet_controller.dart';
import '../../Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import '../../Custom_BlocObserver/button/custtom_button.dart';
import '../../Custom_BlocObserver/notifire_clor.dart';
import '../../utils/medeiaqury/medeiaqury.dart';
import 'controller/profile_controller.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

  final ProfileController profileController = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  late ColorNotifier notifier;
  String ImageUrl = "https://zaveritrading.com/public/storage/image/";
  bool loading = false;
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

  Future<String?> getPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userid = prefs.getInt('userid')!;
    String token = prefs.getString('barrierToken')!;
    ProfileAPI(userid, token);
  }


  @override
  void initState() {
    super.initState();
    getPreference();
    getdarkmodepreviousstate();
    profileController.UserUpdateAPI();
    ImgStatus =profileController.ImgStatus;
    image();
    nameController.text=profileController.fetchData['f_name'];
    emailController.text=profileController.fetchData['email'];
    mobileController.text=profileController.fetchData['phone'].toString();
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
          imageUrl: "$ImageUrl${profileController.fetchData['image']}",height: height / 6, width: width / 3,
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      );
    } else if (ImgStatus == 4) {
      return ClipOval(
          child: Image.file(_imageFile!,
              height: height / 6, width: width / 3, fit: BoxFit.cover)
      );
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
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://zaveritrading.com/api/user/update/$userid'));
    request.files.add(await http.MultipartFile.fromPath('image', _imageFile!.path));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        loading = false;
      });
      Fluttertoast.showToast(
        msg: 'Image Update Successfully',
        backgroundColor: Colors.black,
      );
      Get.back();
    }
    else {
      setState(() {
        loading = false;
      });
      print(response.reasonPhrase);
    }

  }
}

