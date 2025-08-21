  import 'package:carousel_slider/carousel_state.dart';
import 'package:get/get.dart';

  class HomeController extends GetxController {
    // A list of items to display on the home screen.
    // Each item is represented by a Map.
    final List<Map<String, dynamic>> homeItems = [
      {
        'title': 'Pooja',
        'icon': 'https://cdn-icons-png.flaticon.com/128/3598/3598849.png',
        'route': '/pooja',
      },
      {
        'title': 'Mantras',
        'icon': 'https://cdn-icons-png.flaticon.com/128/256/256661.png',
        'route': '/mantras',
      },
      {
        'title': 'Book Priest',
        'icon': 'https://cdn-icons-png.flaticon.com/128/8574/8574877.png',
        'route': '/pandit-booking',
      },
      {
        'title': 'Book Seva',
        'icon': 'https://cdn-icons-png.flaticon.com/128/10913/10913319.png',
        'route': '/bookSeva',
      },
      {
        'title': 'Donation',
        'icon': 'https://cdn-icons-png.flaticon.com/128/2522/2522998.png',
        'route': '/panditDetails',
      },
      {
        'title': 'Festivals',
        'icon': 'https://cdn-icons-png.flaticon.com/128/2071/2071392.png',
        'route': '/festival',
      },

    ];

    // A method to handle item taps.
    void onItemSelected(String route) {
      // Navigate to the specified route using GetX's navigation.
      Get.toNamed(route);
    }
  }
