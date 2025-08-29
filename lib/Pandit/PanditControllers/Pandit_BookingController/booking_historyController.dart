import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

var bookings = <Map<String, dynamic>>[].obs;

/// ✅ Fetch bookings (already existing in your code)
Future<void> fetchBookings(String panditId) async {
  var snapshot = await FirebaseFirestore.instance
      .collection("bookings")
      .where("panditId", isEqualTo: panditId)
      .get();

  bookings.value = snapshot.docs.map((doc) {
    var data = doc.data();
    data["id"] = doc.id; // keep doc id for update
    return data;
  }).toList();
}

/// ✅ Update booking status in Firestore
Future<void> updateBookingStatus(String bookingId, String status) async {
  try {
    await FirebaseFirestore.instance
        .collection("bookings")
        .doc(bookingId)
        .update({"status": status});

    // Update locally in the list too
    int index = bookings.indexWhere((b) => b["id"] == bookingId);
    if (index != -1) {
      bookings[index]["status"] = status;
      bookings.refresh();
    }

    Get.snackbar("Success", "Booking status updated to $status");
  } catch (e) {
    Get.snackbar("Error", "Failed to update status: $e");
  }
}