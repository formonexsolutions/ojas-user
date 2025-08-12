  import 'package:get/get.dart';

  class HomeController extends GetxController {
    // A list of items to display on the home screen.
    // Each item is represented by a Map.
    final List<Map<String, dynamic>> homeItems = [
      {
        'title': 'Pooja',
        'icon': 'assets/home/kalash.png',
        'route': '/pooja',
      },
      {
        'title': 'Mantras',
        'icon': 'assets/home/kalash.png',
        'route': '/mantras',
      },
      {
        'title': 'Book Priest',
        'icon': 'assets/home/kalash.png',
        'route': '/mantras',
      },
      {
        'title': 'Book Seva',
        'icon': 'assets/home/kalash.png',
        'route': '/bookSeva',
      },
      {
        'title': 'Donation',
        'icon': 'assets/home/kalash.png',
        'route': '/donation',
      },
      {
        'title': 'Festivals',
        'icon': 'assets/home/kalash.png',
        'route': '/festival',
      },

    ];

    // A method to handle item taps.
    void onItemSelected(String route) {
      // Navigate to the specified route using GetX's navigation.
      Get.toNamed(route);
    }
  }