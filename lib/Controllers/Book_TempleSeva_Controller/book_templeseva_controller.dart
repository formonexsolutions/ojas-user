import 'package:get/get.dart';

import '../../models/seva_model/book_temple_seva_model.dart';

class BookSevaController extends GetxController {
  // Observables
  var selectedDate = DateTime.now().obs;
  var devoteeName = ''.obs;
  var contactNumber = ''.obs;
  var email = ''.obs;
  var specialInstructions = ''.obs;
  var selectedPayment = ''.obs;

  var isLoading = false.obs;

  void bookSeva() async {
    if (devoteeName.isEmpty || contactNumber.isEmpty || email.isEmpty) {
      Get.snackbar("Error", "Please fill all required fields");
      return;
    }

    isLoading.value = true;

    final seva = SevaModel(
      devoteeName: devoteeName.value,
      contactNumber: contactNumber.value,
      email: email.value,
      specialInstructions: specialInstructions.value,
      paymentMethod: selectedPayment.value,
      sevaDate: selectedDate.value,
    );

    // 👉 Here you can push to Firebase Firestore
    // await FirebaseFirestore.instance.collection("sevaBookings").add(seva.toJson());

    isLoading.value = false;

    Get.snackbar("Success", "Seva booked successfully!");
  }
}
