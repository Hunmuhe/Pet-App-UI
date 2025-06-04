import 'package:get/get.dart';
import 'package:pet_app_ui/data/cats.dart';
import 'package:pet_app_ui/routes/pages.dart';

class Navigation {
  static void toRoot() {
    Get.offAllNamed(Routes.root);
  }

  static void toLaunch() {
    Get.offAllNamed(Routes.launch);
  }

  static void toPetsDetail(Cat cat) {
    Get.toNamed(Routes.petsDetail, arguments: {'cat': cat});
  }
}
