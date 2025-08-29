import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BookingController extends GetxController {
  var userBookings = <Map<String, dynamic>>[].obs;   // ✅ User bookings
  var panditBookings = <Map<String, dynamic>>[].obs; // ✅ Pandit bookings
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchUserBookings();
    fetchPanditBookings();
  }

  /// ✅ Fetch bookings for USER
  Future<void> fetchUserBookings() async {
    try {
      String? email = box.read('email');
      if (email == null) return;

      var query = await FirebaseFirestore.instance
          .collection("bookings")
          .where("useremail", isEqualTo: email)
          .get();

      userBookings.value = query.docs.map((doc) {
        var data = doc.data();
        data["id"] = doc.id;
        return data;
      }).toList();
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch user bookings: $e");
    }
  }

  /// ✅ Fetch bookings for PANDIT
  Future<void> fetchPanditBookings() async {
    try {
      String? email = box.read('email');
      if (email == null) return;

      var query = await FirebaseFirestore.instance
          .collection("bookings")
          .where("priestEmail", isEqualTo: email) // or "panditId"
          .get();

      panditBookings.value = query.docs.map((doc) {
        var data = doc.data();
        data["id"] = doc.id;
        return data;
      }).toList();
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch pandit bookings: $e");
    }
  }

  /// ✅ Update booking status
  Future<void> updateBookingStatus(String bookingId, String status) async {
    try {
      await FirebaseFirestore.instance
          .collection("bookings")
          .doc(bookingId)
          .update({"status": status});

      // Update locally in both lists (in case booking belongs to user or pandit)
      int userIndex = userBookings.indexWhere((b) => b["id"] == bookingId);
      if (userIndex != -1) {
        userBookings[userIndex]["status"] = status;
        userBookings.refresh();
      }

      int panditIndex = panditBookings.indexWhere((b) => b["id"] == bookingId);
      if (panditIndex != -1) {
        panditBookings[panditIndex]["status"] = status;
        panditBookings.refresh();
      }

      Get.snackbar("Success", "Booking status updated to $status");
    } catch (e) {
      Get.snackbar("Error", "Failed to update status: $e");
    }
  }
}
