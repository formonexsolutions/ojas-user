import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../Controllers/AudioController/Aarti_Audio_Controller/aarati_audio_controller.dart';
import '../Controllers/Festival_Controller/festival_controller.dart';
import '../Controllers/Festival_Controller/festival_details_controller.dart';
import '../Controllers/HomepanelControllers/HomeController.dart';
import '../Controllers/Priest_DetailedController/priest_detailedController.dart';

// 1. User

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FestivalController>(() => FestivalController());
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

class AartiViewBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<AudioController>(()=>AudioController());
  }

}

class PriestDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PriestDetailController>(() => PriestDetailController());
  }
}


//2. Pandit