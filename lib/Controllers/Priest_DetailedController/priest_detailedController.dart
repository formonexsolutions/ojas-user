import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../models/Priest_Model/priest_detailedModel.dart';

/// Controller to manage priest details
class PriestDetailController extends GetxController {
  /// Priest data (can be loaded from Firestore later)
  var priest = BookingModel(
    name: "Pandit Rajesh Sharma",
    image:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgd_tTdgAxTEE6FKYjFRzFuMn4IGL954HxSw&s",
    rating: 4.8,
    distance: 4.2,
    poojaTypes: [
      "Griha Pravesh",
      "Satyanarayan",
      "Navagraha",
      "Rudrabhishek",
      "Ganapati",
      "Vastu"
      "Mundan"
    ],

    experience: "10+ years of Vedic experience",
    languages: ["Hindi", "Sanskrit", "English"],
    description:
    "Highly experienced Pandit specializing in Vedic rituals and poojas. "
        "Follows traditional methods and provides personalized spiritual guidance.",
    priestName: '',
    service: '',
    dateTime:null,
  ).obs;
}

/// Controller to handle booking logic
class BookingController extends GetxController {
  var selectedDate = DateTime.now().obs;   // Rx<DateTime>
  var selectedTime = "".obs;               // RxString
  var bookedSlots = <String>[].obs;
  var selectedPoojaType = "".obs; // ✅ Track selected pooja type
// RxList<String>

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Fetch already booked slots for a given priest
  Future<void> fetchBookedSlots(String priestName) async {
    bookedSlots.clear();

    var snapshot = await _db
        .collection("bookings")
        .where("priestName", isEqualTo: priestName)
        .get();

    for (var doc in snapshot.docs) {
      // Ensure stored as ISO string for consistency
      if (doc["dateTime"] != null) {
        bookedSlots.add(doc["dateTime"].toString());
      }
    }
  }

  /// Confirm a booking
  Future<void> confirmBooking(BookingModel booking) async {
    try {
      await _db.collection("bookings").add(booking.toJson());

      // Add booked slot locally
      if (booking.dateTime != null) {
        bookedSlots.add(booking.dateTime!.toIso8601String());
      }

      Get.snackbar("✅ Success", "Booking Confirmed!");
    } catch (e) {
      Get.snackbar("❌ Error", "Failed to book: $e");
    }
  }
}
