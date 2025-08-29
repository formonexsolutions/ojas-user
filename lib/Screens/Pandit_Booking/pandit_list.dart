import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojas_app/Screens/Pandit_Booking/pandit_details.dart';
import 'package:ojas_app/Utils/custom_appbar/custome_appbar.dart';
import '../../Controllers/Booking_Contrller/pandit_booking_controller.dart';
import '../../models/bookings/pandit_list_model.dart';



class PanditListPage1 extends StatelessWidget {
  final PanditController1 controller = Get.put(PanditController1());
  late final PanditModel1 pandit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Priest List",
          screenWidth: Get.width,
          showBack: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.panditList.isEmpty) {
          return Center(child: Text("No Pandits available"));
        }

        return ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: controller.panditList.length,
          itemBuilder: (context, index) {
            final pandit = controller.panditList[index];
            return Card(
              margin: EdgeInsets.only(bottom: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Pandit Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.network(
                        "https://blog.byoh.in/wp-content/uploads/2016/04/PanditJi.jpg",
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12),

                    /// Pandit Info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(pandit.name,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),

                           // if (pandit.available)
                            SizedBox(width: 05,),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text("Available",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                              ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(pandit.email,
                            style: TextStyle(color: Colors.grey[700])),
                        Row(
                          children: [
                            Icon(Icons.shopping_bag,
                              size: 18,color: Colors.grey[500],),
                            Text(pandit.experience+ "  ⭐"+ "4.8",
                                //${pandit.rating}",
                                style: TextStyle(color: Colors.grey[700])),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                            size: 18,color: Colors.grey[700],),
                            Text(pandit.address,
                                style: TextStyle(color: Colors.grey[700]))
                            // Text("${pandit.location} • ${pandit.distance}",
                            //     style: TextStyle(color: Colors.grey[700])),
                          ],
                        ),

                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.language,
                              size: 18,color: Colors.grey[700],),
                            Text(
                              pandit.language.join(", "),
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),

                        /// Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                              Get.to(()=>PanditDetailView(pandit: pandit,));
                              },
                              child: Text("Select Priest",
                              style: TextStyle(color: Colors.white),),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              padding: const EdgeInsets.all(02),
                              margin: const EdgeInsets.all(02),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.purple.shade100),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.phone_in_talk_outlined, color: Colors.orange,
                                size: 25,),
                                onPressed: () {
                                  // Get.snackbar(
                                  //     "Contact", "Call: ${pandit.contact}");
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
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
