import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../../models/Mantra_model/mandtra_model.dart';

class MantraController extends GetxController {
  var categories = ['all', 'Shiva', 'Krishna', 'Ganesha', 'Durga'].obs;

  var mantras = <Mantra>[
    Mantra(
      picture:
      "https://imgs.search.brave.com/cVvOA76DEdceDk5I9IUc2W9kHWUAmbCU52495O8jM2Q/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzNhLzQ3/LzBhLzNhNDcwYTFl/MzBjOGMyMzA3ZWFm/MWIzMDhlOGY2YTM1/LmpwZw",
      title: "Om Ganeshay Namah",
      time: "5:30",
    ),
    Mantra(
      picture:
      "https://imgs.search.brave.com/KKc8HkrtiOvg6mtGoWGL9V65AIbfw_xyGtEwLDmNQ6U/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2YxLzlk/LzUzL2YxOWQ1M2Jj/OTVhMmYzNmJjOTdl/MzQ2NGJiZjZlN2I4/LmpwZw",
      title: "Jai Shri Krishna",
      time: "5:30",
    ),
    Mantra(
      picture:
      "https://imgs.search.brave.com/FBdnptgDK7T5mB4Y6rn3aHcOs-aDLmguvXIA2OHKNSI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzE1LzMxLzM0LzE1/LzM2MF9GXzE1MzEz/NDE1NzBfcnJIdUh6/VXRobG9GbHk1SUto/OEI3cktiRG1MQWo5/bEIuanBn",
      title: "Om Namah Shivay",
      time: "5:30",
    ),
    Mantra(
      picture:
      "https://imgs.search.brave.com/zqzXaNUr_YkLF9kEI9XgU981tbkctk-TuC_VCp7CMLg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA5Lzc1LzYzLzU5/LzM2MF9GXzk3NTYz/NTk5MF82TTdYOE93/QnVIdHhtWml0aTZS/cXk0Z2p5Qzh1TXFp/ZC5qcGc",
      title: "Durga Stotram",
      time: "5:30",
    ),
  ].obs;

  var selectedCategory = 0.obs;
  var selectedSong = (-1).obs;

  List<Color> cardColors = [
    const Color.fromRGBO(242, 146, 27, 1), // orange
    const Color.fromRGBO(243, 244, 246, 1), // grey
  ];
}
