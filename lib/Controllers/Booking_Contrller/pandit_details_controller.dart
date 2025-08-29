import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../../models/bookings/pandit_model.dart';

class PanditDetailController extends GetxController {
  var pandit = Pandit(
    name: "Pandit Rajesh Sharma",
    image: "https://blog.byoh.in/wp-content/uploads/2016/04/PanditJi.jpg",
    rating: 4.8,
    distance: 4.2,
    poojaTypes: ["Griha Pravesh","Satyanarayan","Navagraha","Rudrabhishek","Ganapati","Vastu"],
    sevaOffered: ["Monthly Home Seva","Online Pooja","Temple Rituals","Personal Consultation"],
    experience: "10+ years of Vedic experience",
    languages: "Hindi, Sanskrit, English",
    about: "Highly experienced Pandit specializing in Vedic rituals and pujas.",
  ).obs;

  // selections
  final selectedPooja = "".obs;
  final selectedDate = DateTime.now().obs;
  final selectedTime = "".obs;

  // reactive data from Firestore
  final RxList<String> bookedSlots = <String>[].obs; // for current selectedDate
  final RxList<String> fullyBookedDates = <String>[].obs; // yyyy-MM-dd (optional)

  // IMPORTANT: Use EXACT same format everywhere you store/compare time.
  // Here we pick 'h:mm a' (e.g., "2:00 PM") with a SPACE before AM/PM.
  final List<String> timeSlots = const [
    "8:00 AM","9:00 AM","10:00 AM","11:00 AM","5:00 PM","6:00 PM",
  ];

  String get uiDate => DateFormat('MMMM dd, yyyy').format(selectedDate.value);
  String get ymdDate => DateFormat('yyyy-MM-dd').format(selectedDate.value);

  @override
  void onInit() {
    super.onInit();
    // load today on start
    _fetchBookedSlotsForDate(pandit.value.name, selectedDate.value);
    // (optional) preload fully booked days for calendar disabling
    _fetchFullyBookedDates(pandit.value.name);
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
    _fetchBookedSlotsForDate(pandit.value.name, date);
  }

  void selectTime(String time) => selectedTime.value = time;

  bool isSlotBooked(String time) => bookedSlots.contains(time);

  /// Query bookings for this priest + specific date (yyyy-MM-dd)
  Future<void> _fetchBookedSlotsForDate(String priestName, DateTime date) async {
    bookedSlots.clear();
    final day = DateFormat('yyyy-MM-dd').format(date);

    final snap = await FirebaseFirestore.instance
        .collection('bookings')
        .where('priestName', isEqualTo: priestName)
        .where('date', isEqualTo: day)
        .where('status', isEqualTo: 'confirmed') // optional but recommended
        .get();

    for (final d in snap.docs) {
      // Trim to guard against "2:00PM" vs "2:00 PM" issues
      bookedSlots.add((d['time'] as String).trim());
    }
  }

  /// (Optional) mark dates as fully booked (all timeSlots taken)
  Future<void> _fetchFullyBookedDates(String priestName) async {
    fullyBookedDates.clear();

    // Pull next ~60 days and count by date
    final from = DateTime.now();
    final to = from.add(const Duration(days: 60));

    final snap = await FirebaseFirestore.instance
        .collection('bookings')
        .where('priestName', isEqualTo: priestName)
        .where('status', isEqualTo: 'confirmed')
        .get();

    final Map<String, Set<String>> dateToTimes = {};
    for (final d in snap.docs) {
      final date = (d['date'] as String).trim(); // yyyy-MM-dd
      final time = (d['time'] as String).trim(); // h:mm a
      // keep only in our window (optional)
      final dt = DateTime.tryParse(date);
      if (dt == null) continue;
      if (dt.isBefore(from) || dt.isAfter(to)) continue;

      dateToTimes.putIfAbsent(date, () => <String>{}).add(time);
    }

    for (final entry in dateToTimes.entries) {
      if (entry.value.length >= timeSlots.length) {
        fullyBookedDates.add(entry.key);
      }
    }
  }

  /// Save booking (prevents double-booking)
  Future<void> confirmBooking(String userId) async {
    if (selectedPooja.value.isEmpty || selectedTime.value.isEmpty) {
      Get.snackbar("Error", "Please select Pooja & Time");
      return;
    }

    // double-booking guard
    final existing = await FirebaseFirestore.instance
        .collection('bookings')
        .where('priestName', isEqualTo: pandit.value.name)
        .where('date', isEqualTo: ymdDate)
        .where('time', isEqualTo: selectedTime.value.trim())
        .where('status', isEqualTo: 'confirmed')
        .limit(1)
        .get();

    if (existing.docs.isNotEmpty) {
      Get.snackbar("Slot Unavailable", "This slot is already booked!");
      await _fetchBookedSlotsForDate(pandit.value.name, selectedDate.value);
      return;
    }

    await FirebaseFirestore.instance.collection('bookings').add({
      'priestName': pandit.value.name,
      'date': ymdDate, // yyyy-MM-dd
      'time': selectedTime.value.trim(), // h:mm a
      'pooja': selectedPooja.value,
      'userId': userId,
      'status': 'confirmed',
      'createdAt': FieldValue.serverTimestamp(),
    });

    Get.snackbar("Success", "Booking Confirmed!");
    await _fetchBookedSlotsForDate(pandit.value.name, selectedDate.value);
    await _fetchFullyBookedDates(pandit.value.name);
  }
}
