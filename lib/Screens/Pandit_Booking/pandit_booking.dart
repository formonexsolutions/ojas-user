import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Controllers/Pandit_List_Controller/pandit_list_controller.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/custom_appbar/custome_appbar.dart';


class PanditBookingView extends StatelessWidget {
  final PanditController controller = Get.put(PanditController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Book Priest",
        screenWidth: Get.width,
        showBack: true,
        showActions: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // 🔍 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Your location",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              ),
            ),
            SizedBox(height: 16),

            // 📋 List of Pandits
               Expanded(
                child: Obx(() => ListView.builder(
                  itemCount: controller.panditList.length,
                  itemBuilder: (context, index) {
                    final pandit = controller.panditList[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: EdgeInsets.only(bottom: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 👤 Pandit Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                pandit.imageUrl,
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 12),

                            // 📖 Pandit Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        pandit.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      if (pandit.available)
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.green.shade100,
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            "Available",
                                            style: TextStyle(color: Colors.green, fontSize: 12),
                                          ),
                                        ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Text("${pandit.experience} • ⭐ ${pandit.rating}"),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined,
                                        size: 15,),
                                      Text("${pandit.location} • ${pandit.distance} km"),
                                    ],
                                  ),

                                  Text("🌐 ${pandit.languages.join(", ")}"),
                                  SizedBox(height: 8),

                                  Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.appbar_bgColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.snackbar("Booking", "You selected ${pandit.name}");
                                        },
                                        child: Text("Select Priest",
                                        style: TextStyle(
                                          color: Colors.white
                                        ),),
                                      ),
                                      SizedBox(width: 8),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.phone, color:AppColors.appbar_bgColor),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
              ),
          ],
        ),
      ),
    );
  }
}
