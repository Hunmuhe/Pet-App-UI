import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_app_ui/routes/pages.dart';
import 'package:pet_app_ui/storages/config.dart';

Future<void> main() async {
  await initStorage();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Get.find<ConfigStore>().isFirstLaunch.value == true
          ? Routes.LAUNCH
          : Routes.ROOT,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
    ),
  );
}

Future<void> initStorage() async {
  await GetStorage.init();
  Get.put(ConfigStore());
}
