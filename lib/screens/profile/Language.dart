import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Zaveri/Custom_BlocObserver/Custtom_app_bar/Custtom_app_bar.dart';
import 'package:Zaveri/Custom_BlocObserver/custtom_textfild/consttom_textfild.dart';
import 'package:Zaveri/Custom_BlocObserver/notifire_clor.dart';
import 'package:Zaveri/language/localizetion_services.dart';
import 'package:Zaveri/language/translatekey.dart';
import '../../utils/medeiaqury/medeiaqury.dart';

class Language extends StatefulWidget {
    Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  late ColorNotifier notifier;
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
  final localizationController = Get.find<LocalizationController>();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return ScreenUtilInit(
      builder:  (_,child) {
        return Scaffold(
          backgroundColor: notifier.getwihitecolor,
          appBar: CustomAppBar(
              notifier.getwihitecolor, "Language", notifier.getblck,
              height: height / 15),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height / 30),
                Center(
                  child: Customtextfild.textField(
                      "Search ",
                      notifier.getbluecolor,
                      Icons.search_rounded,
                      notifier.getgrey,
                      notifier.getblck,
                      notifier.getblck,
                      notifier.getgrey),
                ),
                SizedBox(height: height / 25),
                GestureDetector(
                    onTap: () {
                      localizationController.toggleLanguage();
                    },
                    child: select_Language("assets/images/English.png",
                        TKey.English.translate(context))),
                SizedBox(height: height / 20),
                select_Language("assets/images/Deutsch.png",
                    TKey.Deutsch.translate(context)),
                SizedBox(height: height / 20),
                select_Language("assets/images/Spanish.png",
                    TKey.Spanish.translate(context)),
                SizedBox(height: height / 20),
                select_Language(
                    "assets/images/French.png", TKey.French.translate(context)),
                SizedBox(height: height / 20),
                select_Language("assets/images/Portuguese.png",
                    TKey.Portuguese.translate(context)),
                SizedBox(height: height / 20),
                select_Language(
                    "assets/images/Bahasa_Indonesia.png",
                    TKey.BahasaIndonesia.translate(context)),
                SizedBox(height: height / 20),
                select_Language("assets/images/Russian.png",
                    TKey.Russian.translate(context)),
                SizedBox(height: height / 20),
                select_Language("assets/images/Italian.png",
                    TKey.Italian.translate(context)),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget select_Language(image, language_name) {
    return Container(color: Colors.transparent,
      child: Row(
        children: [
          SizedBox(width: width / 15),
          Image.asset(image, height: height / 30),
          SizedBox(width: width / 20),
          Text(
            language_name,
            style: TextStyle(
                color: notifier.getblck,
                fontSize: 16.sp,
                fontFamily: 'Gilroy_Medium'),
          )
        ],
      ),
    );
  }
}
