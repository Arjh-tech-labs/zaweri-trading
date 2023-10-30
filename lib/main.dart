import 'package:firebase_core/firebase_core.dart';
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
  await GetStorage.init();
  runApp(App());
  // BlocOverrides.runZoned(
  //   () => runApp(App()),
  //   blocObserver: AppBlocObserver(),
  // );
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final localizationController = Get.put(LocalizationController());

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
