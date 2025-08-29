import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ojas_app/Screens/Testing/test1.dart';

import '../../models/bookings/pandit_list_model.dart';

class PanditController1 extends GetxController {
  var panditList = <PanditModel1>[].obs;
  var isLoading = true.obs;
  var selectedPooja = "".obs; // initially nothing selected

  @override
  void onInit() {
    fetchPandits();
    super.onInit();
  }

  void fetchPandits() async {
    try {
      isLoading(true);
      final snapshot = await FirebaseFirestore.instance.collection('pandit').get();
      if (snapshot.docs.isNotEmpty) {
        panditList.value =
            snapshot.docs.map((doc) => PanditModel1.fromJson(doc.data(), doc.id)).toList();
      } else {
        // dummy data
        Text("No Data available");
      }
    } finally {
      isLoading(false);
    }
  }
}
