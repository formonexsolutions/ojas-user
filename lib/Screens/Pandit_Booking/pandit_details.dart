import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ojas_app/Screens/Pandit_Booking/pandit_booking.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Controllers/Booking_Contrller/pandit_details_controller.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/custom_appbar/custome_appbar.dart';
import '../../Utils/custom_button.dart';
import '../../models/bookings/pandit_list_model.dart';
import '../Testing/test1.dart';


class PanditDetailView extends StatelessWidget {
  final PanditModel1 pandit;
  final PanditDetailController controller =
  Get.put(PanditDetailController());

  PanditDetailView({super.key,required this.pandit});



  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    double spacing = screenWidth * 0.03;
    final String service = "Satyanarayan Pooja";
    final List<String> poojaTypes;
    return Scaffold(
        appBar: CustomAppBar(
          title: "Priest List",
          screenWidth: Get.width,
          showBack: true,
        ),
      body:
       // final pandit = controller.pandit.value;
         SingleChildScrollView(
           padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Top Image with Name
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "https://blog.byoh.in/wp-content/uploads/2016/04/PanditJi.jpg",
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pandit.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),

                        Text(
                          pandit.email,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 18),
                            SizedBox(width: 5),
                            Text("4.8",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Distance
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("2 km from you"),
              ),

              // Pooja Types
           const Text("Pooja Types Performed",
               style: TextStyle(
                   fontWeight: FontWeight.bold, fontSize: 16)),
           const SizedBox(height: 10),
              Obx(() => Wrap(
                spacing: 10,
                runSpacing: 10,
                children: pandit.poojaTypes.map((type) {
                  final isSelected = controller.selectedPooja.value == type;

                  return GestureDetector(
                    onTap: () {
                      controller.selectedPooja.value = type; // set selected
                    },
                    child: Container(
                      height: 100,
                      width: 90,
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isSelected ? Colors.orange[100] : Colors.grey[200],
                        border: Border.all(
                          color: isSelected ? Colors.orange : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.network(
                              "https://cdn-icons-png.flaticon.com/128/3377/3377166.png",
                              color: isSelected ? Colors.orange : Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            type,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? Colors.orange : Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )),

              // Seva Offered
              sectionTitle("Seva Offered"),
              Text("* Monthly home Seva"),
              Text("* Online Pooja"),
              Text("* Temple Rituals"),
              Text("* Personal Consultation"),


              // About
              sectionTitle("About the Priest"),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.offline_bolt_outlined,size: 15,),
                        Text("10 + year of vedic experience",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.language,size: 15,),
                        Text("Hindi,Marathi, Sanskrit",
                            //pandit.languages,
                            style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),

              // Buttons
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.call,
                            color: Colors.white),
                        label: Text("Call Priest",
                        style: TextStyle(
                          color: Colors.white
                        ),),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.phone,
                            color: Colors.white ),
                        label: Text("WhatsApp", style: TextStyle(
                            color: Colors.white
                        ),),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.dangerous,size: 15,),
                  Text("Payments are made directly to the priest account. Ojas admin"
                      " is not responsible of any transaction issues",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 5,
                  ),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  // Title
                  const Text(
                  "Confirm Booking",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                             const SizedBox(height: 20),

                             // Calendar
                             const Text("📅 Select Date",
                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    Obx(() =>
                        CalendarDatePicker(
                          initialDate: controller.selectedDate.value,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 60)),
                          onDateChanged: controller.selectDate, // this triggers fetch
                        )
                    ),

                    const SizedBox(height: 20),

                             // Time Slots
                             const Text("⏰ Select Time",
                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                             const SizedBox(height: 10),
                    Obx(() => Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: controller.timeSlots.map((t) {
                        final booked = controller.isSlotBooked(t);
                        final selected = controller.selectedTime.value == t;

                        return ChoiceChip(
                          label: Text(t),
                          selected: selected,
                          onSelected: booked ? null : (_) => controller.selectTime(t),
                          selectedColor: Colors.orange,
                          disabledColor: Colors.red.shade200, // visibly blocked
                        );
                      }).toList(),
                    )),

                    const SizedBox(height: 20),
                
                             // Booking Summary
                             const Text("📖 Booking Summary",
                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                             const SizedBox(height: 10),
                             Obx(() => Container(
                 padding: const EdgeInsets.all(16),
                 decoration: BoxDecoration(
                   color: Colors.grey.shade100,
                   borderRadius: BorderRadius.circular(12),
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(pandit.name),
                     Text(pandit.email),
                     Text("Service: ${controller.selectedPooja.value}"),
                     Text("Date: ${controller.uiDate}"), // <-- FIXED
                     Text("Time: ${controller.selectedTime.value.isEmpty ? "Not selected" : controller.selectedTime.value}"),
                   ],
                 ),
                             ),
                          ),
            ]  ),
          ),
              CustomButton(
                  text: "Confirm Booking",
                  onPressed: (){
                Get.to(()=>BookingAndPayment(
                  priestname: pandit.name,
                  priestemail:pandit.email,
                  date: controller.selectedDate.value,
                  time: controller.selectedTime.value,
                  poojatype: controller.selectedPooja.value,));
                  }),
              SizedBox(height: 30,)
        ] )
         )
    );
  }

  Widget sectionTitle(String title) {
    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),

      child: Text(title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }
}