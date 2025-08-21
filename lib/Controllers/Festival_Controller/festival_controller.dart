import 'package:get/get.dart';

import '../../models/festival_model.dart';


class FestivalController extends GetxController {
  final festivals = <Festival>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadFestivals();
  }

  void _loadFestivals() {
    festivals.value = const [
      Festival(
        name: "Diwali",
        date: "29 Oct 2025",
        image:
        "https://i.pinimg.com/736x/4f/69/1e/4f691e0eef4e2c6af314fe7a61fa7199.jpg",
        description:
        "Diwali, also known as Deepavali, is one of the most important and widely celebrated festivals...",
      ),
      Festival(
        name: "Holi",
        date: "14 Mar 2025",
        image:
        "https://cdn.vectorstock.com/i/1000v/65/47/happy-holi-festival-of-india-background-group-vector-45956547.jpg",
        description:
        "Holi is a vibrant and joyful festival celebrated across India, known as the Festival of Colors...",
      ),

      Festival(
          name: "Navratri",
          date: "21 Sep 2025",
          image:
          "https://www.shutterstock.com/image-vector/garba-night-poster-navratri-dussehra-260nw-2202557577.jpg",
          description:
          "Navratri is a nine-night Hindu festival celebrated with great devotion and enthusiasm across India, especially in states like Gujarat, Maharashtra, and West Bengal. The word Navratri means \"nine nights" "in Sanskrit, and during these nine days, devotees worship the nine forms of Goddess Durga, symbolizing power, purity, and protection. Each day is dedicated to a different avatar of the goddess, and people observe fasting, perform rituals, and engage in traditional dance forms like Garba and Dandiya Raas."
      ),

      Festival(
          name: "Ganesh Chaturthi",
          date: "5 Sep 2025",
          image:
          "https://i.pinimg.com/736x/c0/42/2b/c0422bac11493799c7263c6c8818e984.jpg",
          description:
          "Ganesh Chaturthi is a popular Hindu festival that celebrates the birth of Lord Ganesha, the elephant-headed god of wisdom, prosperity, and good fortune. The festival usually lasts for 10 days, starting with the installation of beautifully crafted Ganesha idols in homes and public pandals (temporary stages). Devotees offer sweets like modaks, flowers, and prayers, seeking blessings for success and the removal of obstacles. The atmosphere is filled with devotional music, dance, and community gatherings."
      ),

      Festival(
          name: "Raksha Bandhan",
          date: "18 Aug 2025",
          image:
          "https://img.freepik.com/premium-vector/raksha-bandhan-indian-cultural-festival-background-celebration_1264005-715.jpg",
          description:
          "Raksha Bandhan is a traditional Indian festival that celebrates the special bond between brothers and sisters. On this day, sisters tie a sacred thread called a rakhi on their brothers’ wrists as a symbol of love, protection, and respect. In return, brothers give gifts and promise to protect their sisters throughout their lives. The festival reflects the spirit of family, trust, and emotional bonding. Raksha Bandhan is usually celebrated with sweets, prayers, and family gatherings. "
      ),

      Festival(
          name: "Pongal",
          date: "15 Jan 2025",
          image:
          "https://i.pinimg.com/736x/e7/22/12/e72212bc6d45bd126df7c5e13add364d.jpg",
          description:
          "Pongal is a popular harvest festival celebrated mainly in the southern state of Tamil Nadu, India. It marks the beginning of the sun’s six-month-long journey northward (Uttarayanam) and is dedicated to the Sun God (Surya) as a gesture of gratitude for a good harvest. The festival usually lasts for four days, with each day having its own significance — Bhogi, Thai Pongal, Mattu Pongal, and Kaanum Pongal. Families prepare a special dish called “Pongal”, made from freshly harvested rice, jaggery, and milk, which is offered to the Sun God."
      ),

      Festival(
          name: "Makar Sankranti",
          date: "14 Jan 2025",
          image:
          "https://i.pinimg.com/474x/11/86/fe/1186feb3cdc3a09a84e5aac004708d14.jpg",
          description:
          "Makar Sankranti is a major Hindu festival that marks the transition of the Sun into the zodiac sign of Capricorn (Makar). It usually falls on 14th January every year and signifies the end of the winter solstice and the beginning of longer, warmer days. Celebrated across India with different names like Lohri (Punjab), Pongal (Tamil Nadu), and Uttarayan (Gujarat), the festival is associated with harvest, prosperity, and gratitude. People celebrate by flying kites, taking holy dips in rivers, and preparing traditional sweets like tilgul."
      ),
    ];
  }
}
