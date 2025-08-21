import 'package:get/get.dart';
import '../../models/bookings/pandit_booking_model.dart';


class PanditBookingController extends GetxController {
  // Form fields
  var customerName = ''.obs;
  var panditName = ''.obs;
  var poojaType = ''.obs;
  var date = DateTime.now().obs;
  var address = ''.obs;

  // List of bookings
  var bookings = <PanditBooking>[].obs;

  // Add booking
  void bookPandit() {
    final newBooking = PanditBooking(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      customerName: customerName.value,
      panditName: panditName.value,
      date: date.value,
      poojaType: poojaType.value,
      address: address.value,
    );
    bookings.add(newBooking);
    Get.snackbar("Success", "Pandit booked successfully!");
  }
}
