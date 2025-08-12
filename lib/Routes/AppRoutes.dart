import 'package:get/get.dart';

import '../Bindings/binding.dart';
import '../Login/SplashScreens/SplashScreen1.dart';
import '../Screens/Homepanel/Homepage.dart';

// A class to hold static route names for easy access.
abstract class AppRoutes {
  static const splash = '/';
  static const home = '/home';
}

// The list of all pages in the application with their bindings.
abstract class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () =>  SplashScreen(),
      // No binding needed for the splash screen as it only handles navigation.
    ),
    GetPage(
      name: AppRoutes.home,
      page: () =>   HomeView(),
      // The HomeBinding is applied to the home page.
      binding: HomeBinding(),
    ),
  ];
}
