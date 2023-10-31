import 'package:Zaveri/firebase/firebaseclass.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:Zaveri/language/localizetion_services.dart';
import 'package:Zaveri/screens/Splash_Screen/Splash_Screen.dart';
import 'Custom_BlocObserver/notifire_clor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initFunction();
  await GetStorage.init();
  runApp(App());
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final localizationController = Get.put(LocalizationController());


  @override
  void initState() {
    super.initState();
    setUpNotification();


  }


  setUpNotification() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print('FCM Token: $token');

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        init: localizationController,
        builder: (LocalizationController controller) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => ColorNotifier()),
            ],
            child: GetMaterialApp(
              locale: controller.currentLanguage != ''
                  ? Locale(controller.currentLanguage, '')
                  : null,
              localeResolutionCallback:
                  LocalizationService.localResolutioncallBack,
              supportedLocales: LocalizationService.supportedlocales,
              localizationsDelegates: LocalizationService.localizationsDelegate,
              debugShowCheckedModeBanner: false,
              home: Spash_Screen(),
              // home: SurajYadav(),
            ),
          );
        });
  }
}
