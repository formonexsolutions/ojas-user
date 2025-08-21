import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../Controllers/Festival_Controller/festival_controller.dart';
import '../Controllers/Festival_Controller/festival_details_controller.dart';
import '../Controllers/HomepanelControllers/HomeController.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());

  }
}

class FestivalDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FestivalDetailController>(() => FestivalDetailController());
  }
}

class FestivalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FestivalController>(() => FestivalController());
  }
}

