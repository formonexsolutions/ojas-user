import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojas_app/Controllers/Festival_Controller/festival_details_controller.dart';

import '../../Controllers/Festival_Controller/festival_controller.dart';
import '../../Routes/AppRoutes.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/custom_appbar/custome_appbar.dart';
import '../../models/festival_model.dart';


class FestivalListView extends GetView<FestivalController> {
  const FestivalListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Festival List",
        screenWidth: Get.width,
        showBack: true,
        showActions: true,
      ),
      body: Obx(() {
        final items = controller.festivals;
        if (items.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final Festival f = items[index];
            return InkWell(
              onTap: () {
                // ✅ Pass the *model* itself as GetX argument
                Get.toNamed(AppRoutes.festivalDetails, arguments: f);
               // Get.put(FestivalDetailController());
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.purple.shade100),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: Image.network(
                        f.image,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(f.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(height: 5),
                            Text(
                              "Date: ${f.date}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
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
