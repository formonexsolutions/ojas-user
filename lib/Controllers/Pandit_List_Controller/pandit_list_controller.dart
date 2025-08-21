import 'package:get/get.dart';

import '../../models/bookings/pandit_list_model.dart';


class PanditController extends GetxController {
  var panditList = <PanditModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadPandits();
  }

  void loadPandits() {
    panditList.assignAll([
      PanditModel(
        name: "Pandit Sharma",
        experience: "8 years",
        rating: 4.8,
        location: "Koramangala",
        distance: 2.5,
        languages: ["English", "Hindi", "Tamil"],
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgd_tTdgAxTEE6FKYjFRzFuMn4IGL954HxSw&s",
        available: true,
      ),
      PanditModel(
        name: "Pandit Sharma",
        experience: "8 years",
        rating: 4.8,
        location: "Koramangala",
        distance: 2.5,
        languages: ["English", "Hindi", "Tamil"],
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiM6EwOfuCEEOCri9pbocTjNefB8uC4NZ9EA&s",
        available: true,
      ),
      PanditModel(
        name: "Pandit Sharma",
        experience: "8 years",
        rating: 4.8,
        location: "Koramangala",
        distance: 2.5,
        languages: ["English", "Hindi", "Tamil"],
        imageUrl: "https://vaikunth.co/front_assets/image/home-page-image/namastey-pandit.png",
        available: true,
      ),
    ]);
  }
}
