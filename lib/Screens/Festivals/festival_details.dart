import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controllers/Festival_Controller/festival_details_controller.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/custom_appbar/custome_appbar.dart';
import '../../models/festival_model.dart';

class FestivalDetailView extends GetView<FestivalDetailController> {
  const FestivalDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar:CustomAppBar(
        title: "Festival Details",
        screenWidth: Get.width,
        showBack: true,
        showActions: true,
      ),

      body: Obx(() {
        final Festival? f = controller.festival.value;

        if (f == null) {
          // Defensive UI if someone navigates without arguments
          return const Center(child: Text('No festival data provided'));
        }

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  f.image,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.purple.shade100),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          f.name,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Date: ${f.date}",
                          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          f.description,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
