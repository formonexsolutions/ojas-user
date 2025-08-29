import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojas_app/Controllers/Pooja_Controller/pooja_controller.dart';

import '../../Controllers/Mantra_Controller/mantra_controller.dart';
import '../../Utils/custom_appbar/custome_appbar.dart';


class PoojaView extends StatelessWidget {
  final controller = Get.put(PoojaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Pooja",
        screenWidth: Get.width,
        showBack: true,
        showActions: true,
      ),
      body: Column(

        children: [

          const SizedBox(height: 15),

          // 🔹 Categories
          Obx(() => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
              List.generate(controller.categories.length, (index) {
                return GestureDetector(
                  onTap: () => controller.selectedCategory.value = index,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    height: 35,
                    width: 80,
                    decoration: BoxDecoration(
                      color: controller.selectedCategory.value == index
                          ? controller.cardColors[0]
                          : controller.cardColors[1],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      controller.categories[index],
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: controller.selectedCategory.value == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              }),
            ),
          )),

          const SizedBox(height: 15),

          // 🔹 Title Row
          Row(
            children: [
              Text(
                'All Pooja',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                'View all',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(242, 146, 27, 1),
                ),
              ),
            ],
          ),

          // 🔹 Mantra List
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.pooja.length,
              itemBuilder: (context, index) {
                final mantra = controller.pooja[index];
                return Container(
                  height: 76.6,
                  margin: const EdgeInsets.symmetric(
                      vertical: 6, horizontal: 10),
                  decoration: BoxDecoration(
                    color: controller.selectedSong.value == index
                        ? controller.cardColors[0]
                        : controller.cardColors[1],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        mantra.picture,
                        width: 60,
                        height: 60,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    title: Text(
                      mantra.title,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      mantra.time,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    trailing:
                    const Icon(Icons.play_arrow, color: Colors.black),
                    onTap: () {
                      controller.selectedSong.value = index;
                      _showBottomSheet(context, mantra.picture, mantra.title);
                    },
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String picture, String title) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 150,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(picture, height: 80, width: 80),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        Icon(Icons.skip_previous, size: 32, color: Colors.grey),
                        Icon(Icons.play_circle_fill,
                            size: 40, color: Color.fromRGBO(242, 146, 27, 1)),
                        Icon(Icons.skip_next, size: 32, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
