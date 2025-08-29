import 'dart:ui';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends GetxController {
  var categories = ['all', 'Shiva', 'Krishna', 'Ganesha', 'Durga'].obs;
  var selectedCategory = 0.obs;
  var selectedSong = (-1).obs;

  List<Color> cardColors = [
    const Color.fromRGBO(242, 146, 27, 1), // orange
    const Color.fromRGBO(243, 244, 246, 1), // grey
  ];

  final player = AudioPlayer();
  var isPlaying = false.obs;
  var currentIndex = (-1).obs;
  var position = Duration.zero.obs;
  var duration = Duration.zero.obs;

  List<Map<String, String>> songs = [
    {
      "title": "Ganesh Aarti",
      "url":
      "https://archive.org/download/ShriGaneshMala108OleerupiMani/Jai%20Ganesh%20Jai%20Ganesh%20Deva.mp3",
      "image": "https://m.media-amazon.com/images/I/71NDiyHzBlL.jpg"
    },
    {
      "title": "Jai Shri Krishna",
      "url":
      "https://archive.org/download/Krishna11/Om%20Jai%20Shri%20Krishn%20Hare%20Aarti.mp3",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4IRR6SkBd1FX6V6LTcbz5-UodO0uqEvnveg&s"
    },
    {
      "title": "Jai Shri Krishna",
      "url":
      "https://archive.org/download/BeautifulHindiBhajans/Shri%20Krishna%20Aarti.mp3",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTS_FxCS7wyTHKSDAB3mqnAXz60vN_bsqymWQ&s"
    },
    {
      "title": "Shree Ram Jay Ram Jay Jaya Ram",
      "url":
      "https://archive.org/download/ShreeRam/Shree%20Ram%20Jay%20Ram%20Jay%20Jaya%20Ram%20By%20Sadhana%20Sargam%20-%20Shree%20Rama%20Mantra%20108%20Times%20(%20Full%20Songs%20).mp3",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCfKhklFSp85TrNb-ZiX5zavpGHGZalOzZkg&s"
    },
    {
      "title": "Mahadev Aarati",
      "url":
      "https://archive.org/download/Rudram_20161231/Om%20Jai%20Shiv%20Omkara.mp3",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQf0XO6qxt7mpc_hyGkvQqNdkmnzr_9hcupXw&s"
    },
    {
      "title": "Om Mahalaxmi",
      "url":
      "https://archive.org/download/DiwaiLaxmiAarti/Mahalaxmi%20Aarti.mp3",
      "image": "https://c.saavncdn.com/396/Om-Jai-Laxmi-Mata-Diwali-Poojan-Hindi-2019-20191024051719-500x500.jpg"
    },
    {
      "title": "Om Jay Jagdish",
      "url":
      "https://archive.org/download/BalajiMantra/Aarti%20Jai%20Tirupati%20Balaji%20Ki.mp3",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4aYk24iok1WCJ0goAXrj440PpkrM0TagvZw&s"
    },
    {
      "title": "Tirupati Balaji",
      "url":
      "https://archive.org/download/NarayanaNarayanaJayJayGovindaHare/Narayana%20Narayana%20Jay%20Jay%20Govinda%20Hare.mp3",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxW9Yp9QTtFgFSLGIns3eYY1Gi9mmAaI3ndw&s"
    },

    {
      "title": "Gujarati Bhajan",
      "url":
      "https://archive.org/download/GujaratiBhajan36/Gujarati%20Bhajan%2025.mp3",
      "image": "https://m.media-amazon.com/images/I/61Hqjcwlj1L._UF894,1000_QL80_.jpg"
    },

    {
      "title": "Gayatri Mantra",
      "url":
      "https://archive.org/download/GayatriMantra_201801/gayatri1.mp3",
      "image": "https://dorituals.com/wp-content/uploads/2025/03/86248665de60261112b1178840d2cec6.jpg"
    },
    {
      "title": "Gayatri Mantra",
      "url":
      "https://archive.org/download/shri-rattan-mohan-sharma-gayatri-mantra/Rattan%20Mohan%20Sharma%20—%20Gayatri%20Mantra%20-%20108%20Chants.mp3",
      "image": "https://dorituals.com/wp-content/uploads/2025/03/86248665de60261112b1178840d2cec6.jpg"
    },
    {
      "title": "Gayatri Mantra",
      "url":
      "https://archive.org/download/HindiBookMantraStrotas_201903/Gayatri_Mantram_By_Swami_108_Times.mp3",
      "image": "https://i.pinimg.com/736x/c1/1f/71/c11f71591784a0f88d64e7f881c1daae.jpg"
    },

    {
      "title": "Styanarayan Pooja",
      "url":
      "https://archive.org/download/PretrajSarkarKiAarti/Satya-Narayan-Ji-Ki-Aarti.mp3",
      "image": "https://i.pinimg.com/736x/c1/1f/71/c11f71591784a0f88d64e7f881c1daae.jpg"
    },

    {
      "title": "Satyanarayanan Pooja",
      "url":
      "https://archive.org/download/PretrajSarkarKiAarti/Satya-Narayan-Ji-Ki-Aarti.mp3",
      "image": "https://i.pinimg.com/736x/c1/1f/71/c11f71591784a0f88d64e7f881c1daae.jpg"
    },


  ];

  @override
  void onInit() {
    super.onInit();

    /// track position & duration
    player.positionStream.listen((pos) => position.value = pos);
    player.durationStream.listen((dur) => duration.value = dur ?? Duration.zero);

    /// update play/pause status
    player.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
    });

    /// Auto-play next song when current ends
    player.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) {
        nextSong();
      }
    });
  }

  Future<void> playSong(int index) async {
    currentIndex.value = index;
    await player.setUrl(songs[index]["url"]!);
    player.play();
  }

  void togglePlayPause() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  void nextSong() {
    if (currentIndex.value < songs.length - 1) {
      playSong(currentIndex.value + 1);
    } else {
      /// reached last song → stop
      player.stop();
      currentIndex.value = -1;
    }
  }

  void previousSong() {
    if (currentIndex.value > 0) {
      playSong(currentIndex.value - 1);
    }
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}
