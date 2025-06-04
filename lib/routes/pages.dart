import 'package:get/get.dart';
import 'package:pet_app_ui/pages/launch/index.dart';
import 'package:pet_app_ui/pages/petsDetail/index.dart';
import 'package:pet_app_ui/pages/root.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.ROOT, page: () => const RootPage()),
    GetPage(name: Routes.LAUNCH, page: () => const LaunchPage()),
    GetPage(name: Routes.PETS_DETAIL, page: () => const PetsDetailPage()),
  ];
}
