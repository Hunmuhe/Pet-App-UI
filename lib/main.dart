import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_app_ui/l10n/app_localizations.dart';
import 'package:pet_app_ui/routes/pages.dart';
import 'package:pet_app_ui/storages/config.dart';

Future<void> main() async {
  await initStorage();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Get.find<ConfigStore>().isFirstLaunch.value == true
          ? Routes.launch
          : Routes.root,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      fallbackLocale: const Locale('en'),
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('zh'), // Chinese
      ],
    ),
  );
}

Future<void> initStorage() async {
  await GetStorage.init();
  Get.put(ConfigStore());
}
