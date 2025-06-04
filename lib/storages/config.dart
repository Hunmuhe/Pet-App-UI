import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ConfigStore extends GetxController {
  final box = GetStorage();
  var isFirstLaunch = true.obs;
  var localLanguage = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    isFirstLaunch.value = box.read('isFirstLaunch') ?? true;
    localLanguage.value = box.read('localLanguage') ?? 'en';
  }

  Future<void> setFirstLaunch(bool value) async {
    isFirstLaunch.value = value;
    await box.write('isFirstLaunch', value);
  }

  Future<void> setLocalLanguage(String value) async {
    localLanguage.value = value;
    await box.write('localLanguage', value);
  }
}
