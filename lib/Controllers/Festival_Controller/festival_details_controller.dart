import 'package:get/get.dart';

import '../../models/festival_model.dart';


class FestivalDetailController extends GetxController {
  // Rxn allows null until we assign the passed argument
  final festival = Rxn<Festival>();

  @override
  void onInit() {
    super.onInit();
    final arg = Get.arguments;
    if (arg is Festival) {
      festival.value = arg;
    } else if (arg is Map) {
      // optional: allow Map arguments as fallback
      try {
        festival.value = Festival.fromMap(Map<String, dynamic>.from(arg));
      } catch (_) {}
    }
  }
}
