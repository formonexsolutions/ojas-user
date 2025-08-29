import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojas_app/Utils/custom_appbar/custome_appbar.dart';
import '../../Controllers/Priest_DetailedController/priest_detailedController.dart';
import '../../models/Priest_Model/priest_detailedModel.dart';
import 'package:intl/intl.dart';

import '../../models/bookings/pandit_list_model.dart';

class PriestDetailView extends GetView<PriestDetailController> {
 // final PanditModel1 pandit;
  final pandit = Get.arguments; // 👈 get the PanditModel1 object

  PriestDetailView( {super.key});
  final BookingController controller1 = Get.put(BookingController());

   final String priestName = "Pandit Rajesh Sharma";
   final String service = "Satyanarayan Pooja";

   final List<String> timeSlots = [
     "09:00 AM",
     "10:00 AM",
     "11:00 AM",
     "02:00 PM",
     "03:00 PM",
     "04:00 PM",
   ];
  @override
  Widget build(BuildContext context) {
    //controller.fetchBookedSlots(priestName);
    return Scaffold(
      appBar: CustomAppBar(
          title: "Priest Details",
          screenWidth: Get.width,
          showBack: true
      ),
      body: Obx(() {
        final p = controller.priest.value;
        return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image + Name + Rating
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          p.image,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Text(
                          p.priestName,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 10,
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: Colors.orange,
                                size: 20),
                            Text(
                              "${p.rating} • ${p.distance} km from you",
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.w700
                              ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Pooja Types
                  const Text("Pooja Types Performed",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: p.poojaTypes.map((type) {
                      return
                        Container(
                          height: 100,
                          width: 90,
                          padding: const EdgeInsets.all(05),
                          margin: const EdgeInsets.all(05),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                          ),
                          child: Column(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  child: Image.network(
                                      "https://cdn-icons-png.flaticon.com/128/3377/3377166.png")
                              ),
                              Text(type, style: TextStyle(
                                  fontSize: 12
                              ),)

                            ],
                          ),
                        );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  // Seva Offered
                  const Text("Seva Offered",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 20),

                  // About
                  const Text("About the Priest",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  Text("📌 ${p.experience}"),
                  Text("🌐 Languages: ${p.languages.join(', ')}"),
                  const SizedBox(height: 8),
                  Text(p.description),
                  const SizedBox(height: 20),

                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {},
                          icon: const Icon(Icons.call),
                          label: const Text("Call Priest"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {},
                          icon: const Icon(Icons.phone),
                          label: const Text("WhatsApp"),
                        ),
                      ),
                    ],
                  ),
                  Text("Select Date",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Obx(() =>
                      CalendarDatePicker(
                        initialDate: controller1.selectedDate.value,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        onDateChanged: (date) {
                          controller1.selectedDate.value = date;
                        },
                      )),
                  SizedBox(height: 20),

                  /// Select Time
                  Text("Select Time",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Obx(() =>
                      Wrap(
                        spacing: 10,
                        children: timeSlots.map((slot) {
                          String dateTimeKey =
                              "${controller1.selectedDate.value
                              .toString()
                              .split(' ')[0]} $slot";

                          bool isBooked = controller1.bookedSlots.any((b) =>
                          b.contains(
                              controller1.selectedDate.value.toString().split(
                                  ' ')[0]) &&
                              b.contains(slot));

                          return ChoiceChip(
                            label: Text(slot),
                            selected: controller1.selectedTime.value == slot,
                            onSelected: isBooked
                                ? null
                                : (val) {
                              controller1.selectedTime.value = slot;
                            },
                            selectedColor: Colors.orange,
                            disabledColor: Colors.grey.shade300,
                          );
                        }).toList(),
                      )),
                  SizedBox(height: 20),

                  /// Booking Summary
                  Obx(() =>
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Booking Summary",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text("Priest: $priestName"),
                              Text("Service: $service"),
                              Text("Date: ${controller1.selectedDate.value
                                  .toLocal().toString().split(' ')[0]}"),
                              Text("Time: ${controller1.selectedTime.value}"),
                            ],
                          ),
                        ),
                      )),
                  // Spacer(),

                  /// Confirm Button
                  Obx(() =>
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: Colors.orange),
                        onPressed: controller1.selectedTime.value.isEmpty
                            ? null
                            : () {
                          // Extract selected date
                          DateTime date = controller1.selectedDate.value;

                          // Parse the selected time string (e.g., "09:00 AM")
                          String time = controller1.selectedTime.value;
                          int hour = int.parse(time.split(":")[0]);
                          int minute = int.parse(time.split(":")[1].split(
                              " ")[0]);
                          String period = time.split(" ")[1]; // AM or PM

                          if (period == "PM" && hour != 12) {
                            hour += 12;
                          } else if (period == "AM" && hour == 12) {
                            hour = 0; // midnight
                          }

                          // Combine date + time into DateTime
                          DateTime selectedDateTime =
                          DateTime(
                              date.year, date.month, date.day, hour, minute);

                          // ✅ Format for display
                          String formattedDate = DateFormat("dd/MM/yyyy")
                              .format(selectedDateTime);
                          String formattedTime = DateFormat("h:mm a").format(
                              selectedDateTime);

                          // Example: show in Snackbar
                          Get.snackbar("Booking Confirmed",
                              "Date: $formattedDate\nTime: $formattedTime");

                          // ✅ Store in Firebase as DateTime
                          BookingModel booking = BookingModel(
                            priestName: priestName,
                            image: p.image,
                            rating: p.rating,
                            distance: p.distance,
                            poojaTypes: p.poojaTypes,
                            experience: p.experience,
                            languages: p.languages,
                            description: p.description,
                            service: service,
                            dateTime: selectedDateTime,
                            name: "User Name", // <-- pass actual user name here
                          );

                          controller1.confirmBooking(booking);
                        },
                        child: const Text("Confirm Booking"),
                      )),
                ])
        );
      })
    );
  }
}
