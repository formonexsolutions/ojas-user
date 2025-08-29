import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/AudioController/Aarti_Audio_Controller/aarati_audio_controller.dart';
import '../../Utils/custom_appbar/custome_appbar.dart';

class FullPlayerView extends StatelessWidget {
  final AudioController controller = Get.find<AudioController>();

  @override
  Widget build(BuildContext context) {
    final song = controller.songs[controller.currentIndex.value];

    return Scaffold(
      appBar:CustomAppBar(
        title: "Pooja",
        screenWidth: Get.width,
        showBack: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          // Song Image
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              song["image"]!,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),

          // Title & Subtitle
          Text(
            song["title"]!,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          // Progress bar
          Obx(() {
            return Column(
              children: [
                Slider(
                  min: 0,
                  max: controller.duration.value.inSeconds.toDouble(),
                  value: controller.position.value.inSeconds
                      .toDouble()
                      .clamp(0, controller.duration.value.inSeconds.toDouble()),
                  activeColor: Colors.orange,
                  onChanged: (value) {
                    controller.player.seek(Duration(seconds: value.toInt()));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${controller.position.value.inMinutes}:${(controller.position.value.inSeconds % 60).toString().padLeft(2, '0')}",
                      ),
                      Text(
                        "${controller.duration.value.inMinutes}:${(controller.duration.value.inSeconds % 60).toString().padLeft(2, '0')}",
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),

          SizedBox(height: 10),

          // Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.shuffle, color: Colors.grey), onPressed: () {}),
              SizedBox(width: 20),
              IconButton(
                  icon: Icon(Icons.skip_previous, size: 32),
                  onPressed: controller.previousSong),
              Obx(() => IconButton(
                  icon: Icon(
                      controller.isPlaying.value
                          ? Icons.pause_circle
                          : Icons.play_circle,
                      size: 64,
                      color: Colors.orange),
                  onPressed: controller.togglePlayPause)),
              IconButton(
                  icon: Icon(Icons.skip_next, size: 32),
                  onPressed: controller.nextSong),
              SizedBox(width: 20),
              IconButton(
                  icon: Icon(Icons.repeat, color: Colors.grey),
                  onPressed: () {}),
            ],
          ),
          SizedBox(height: 30),

          // Up Next Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Up Next", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("View All", style: TextStyle(color: Colors.orange)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.songs.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  bool isCurrent = controller.currentIndex.value == index;

                  return ListTile(
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
                      style: TextStyle(
                        fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                        color: isCurrent ? Colors.orange : Colors.black,
                      ),
                    ),
                    trailing: Icon(
                      isCurrent
                          ? (controller.isPlaying.value
                          ? Icons.equalizer   // playing
                          : Icons.pause)      // selected but paused
                          : Icons.play_arrow,     // default
                      color: isCurrent ? Colors.orange : Colors.grey,
                    ),
                    onTap: () {
                      controller.playSong(index);
                    },
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
