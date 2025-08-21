import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controllers/Booking_Contrller/pandit_details_controller.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/custom_appbar/custome_appbar.dart';


class PanditDetailView extends StatelessWidget {
  final PanditDetailController controller =
  Get.put(PanditDetailController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    double spacing = screenWidth * 0.03;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Book Priest",
        screenWidth: Get.width,
        showBack: true,
        showActions: true,
      ),
      body: Obx(() {
        final pandit = controller.pandit.value;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              // Top Image with Name
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      pandit.image,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
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
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 18),
                            SizedBox(width: 5),
                            Text("${pandit.rating}",
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
                child: Text("${pandit.distance} km from you"),
              ),

              // Pooja Types
              sectionTitle("Pooja Types Performed"),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: pandit.poojaTypes
                      .map((type) => Chip(
                    label:
                    Container(
                      height: 50,
                      width: 70,
                      child: Column(
                        children: [
                          Image.network("https://cdn-icons-png.flaticon.com/128/315/315101.png",
                          height: 20,),
                          Text(type,
                          style: TextStyle(
                            fontSize: 10
                          ),),
                        ],
                      ),
                    ),

                    backgroundColor: Colors.grey.shade100,
                  ))
                      .toList(),
                ),
              ),

              // Seva Offered
              sectionTitle("Seva Offered"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: pandit.sevaOffered
                      .map((seva) => Row(
                    children: [
                      Icon(Icons.check, color: Colors.orange),
                      SizedBox(width: 5),
                      Text(seva),
                    ],
                  ))
                      .toList(),
                ),
              ),

              // About
              sectionTitle("About the Priest"),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pandit.experience,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange)),
                    Text(pandit.languages,
                        style: TextStyle(color: Colors.black54)),
                    SizedBox(height: 10),
                    Text(pandit.about),
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
                        icon: Icon(Icons.call),
                        label: Text("Call Priest"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.phone),
                        label: Text("WhatsApp"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
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
