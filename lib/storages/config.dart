import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ConfigStore extends GetxController {
  final box = GetStorage();
  var isFirstLaunch = true.obs;

  @override
  void onInit() {
    super.onInit();
    isFirstLaunch.value = box.read('isFirstLaunch') ?? true;
  }

  Future<void> setFirstLaunch(bool value) async {
    isFirstLaunch.value = value;
    await box.write('isFirstLaunch', value);
  }

  void clearConfig() {
    isFirstLaunch.value = true;
    box.remove('isFirstLaunch');
  }
}
