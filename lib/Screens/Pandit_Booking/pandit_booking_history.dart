import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojas_app/Utils/custom_appbar/custome_appbar.dart';

import '../../Controllers/Booking_Contrller/panditbooking_history_controller.dart'; // <- make sure file name matches

class UserBookingHistory extends StatelessWidget {
  final BookingController controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Booking History",
        screenWidth: Get.width,
        showBack: true,
      ),
      body: Obx(() {
        if (controller.userBookings.isEmpty) {   // <- use userBookings list
          return const Center(child: Text("No bookings yet"));
        }
        return ListView.builder(
          itemCount: controller.userBookings.length,
          itemBuilder: (context, index) {
            var booking = controller.userBookings[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text("Booked Seva: ${booking["poojaType"]}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Priest: ${booking["priestName"]}"),
                    Text("Date: ${booking["date"]}"),
                    Text("Time: ${booking["time"]}"),
                    Text("Amount: ₹${booking["amount"]}"),
                  ],
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Status",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text("${booking["status"]}"),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
