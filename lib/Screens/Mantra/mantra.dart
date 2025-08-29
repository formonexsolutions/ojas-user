import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Controllers/AudioController/Aarti_Audio_Controller/aarati_audio_controller.dart';
import '../../Controllers/Mantra_Controller/mantra_controller.dart';
import '../../Utils/custom_appbar/custome_appbar.dart';
import 'mantra_full_player_view.dart';



class MatraAartiView extends StatelessWidget {

  final AudioMantaController controller = Get.put(AudioMantaController());

  var selectedCategory = 0.obs;
  var selectedSong = (-1).obs;

  List<Color> cardColors = [
    const Color.fromRGBO(242, 146, 27, 1), // orange
    const Color.fromRGBO(243, 244, 246, 1), // grey
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:CustomAppBar(
        title: "Pooja",
        screenWidth: Get.width,
        showBack: true,
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 15,),
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
            SizedBox(height: 10,),// 🔹 Title Row
            Row(
              children: [
                Text(
                  'Popular Pooja',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
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
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            // 🔹 Title Row
            Row(
              children: [
                Text(
                  'All Pooja',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
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
            SizedBox(height: 10,),
            // Song list
            Expanded(
                child:
                ListView.builder(
                  itemCount: controller.songs.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final isCurrent = controller.currentIndex.value == index;
                      final isPlaying = controller.isPlaying.value;

                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isCurrent
                              ? Colors.orange.shade100 // highlight selected container
                              : const Color.fromRGBO(243, 244, 246, 1),
                        ),

                        padding: const EdgeInsets.all(1),
                        margin: const EdgeInsets.all(1),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              controller.songs[index]["image"]!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            controller.songs[index]["title"]!,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isCurrent ? Colors.orange : Colors.black, // text color change
                            ),
                          ),
                          trailing: Icon(
                            isCurrent && isPlaying ? Icons.pause : Icons.play_arrow,
                            color: isCurrent ? Colors.orange : Colors.black, // icon color change
                          ),
                          onTap: () {
                            if (isCurrent) {
                              controller.togglePlayPause(); // pause/play current song
                            } else {
                              controller.playSong(index); // start new song
                            }
                          },
                        ),
                      );
                    });
                  },
                )
            ),

            // Bottom Mini Player
            SafeArea(
              child: Obx(() {
                if (controller.currentIndex.value == -1) {
                  return SizedBox.shrink(); // hide if no song selected
                }

                final song =
                controller.songs[controller.currentIndex.value];

                return
                  GestureDetector(
                    onTap: () {
                      Get.to(() => MantraFullPlayerView()); // navigate to full player
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        boxShadow: [BoxShadow(blurRadius: 5, color: Colors.white)],
                      ),
                      child:
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(song["image"]!,
                                    width: 50, height: 50, fit: BoxFit.cover),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(song["title"]!,
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.skip_previous),
                                  onPressed: controller.previousSong),
                              Obx(() => IconButton(
                                  icon: Icon(controller.isPlaying.value
                                      ? Icons.pause_circle
                                      : Icons.play_circle),
                                  iconSize: 40,
                                  color: Colors.orange,
                                  onPressed: controller.togglePlayPause)),
                              IconButton(
                                  icon: Icon(Icons.skip_next),
                                  onPressed: controller.nextSong),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
              }),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
