import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_app_ui/routes/pages.dart';

Future<void> main() async {
  await initStorage();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LAUNCH,
      // initialRoute: Get.find<ConfigStore>().isFirstLaunch.value == true
      //     ? Routes.LAUNCH
      //     : Routes.ROOT,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
    ),
  );
}

Future<void> initStorage() async {
  // await GetStorage.init();
  // Get.put(ConfigStore());
  // Get.put(UserStore());
}
