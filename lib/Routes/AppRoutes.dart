import 'package:get/get.dart';
import '../Bindings/binding.dart';
import '../Login/SplashScreens/SplashScreen1.dart';
import '../Screens/Calender/calender.dart';
import '../Screens/Festivals/festival_details.dart';
import '../Screens/Festivals/festival_list.dart';
import '../Screens/Homepanel/Homepage.dart';
import '../Screens/Mantra/mantra.dart';
import '../Screens/Pandit_Booking/pandit_booking.dart';
import '../Screens/Pandit_Booking/pandit_details.dart';
import '../Screens/Pooja/pooja.dart';
import '../Screens/Temple/book_seva/book_seva.dart';
import '../Screens/Temple/book_seva/book_templeseva.dart';
import '../Screens/User_Login/user_login.dart';
import '../Screens/User_Login/user_registration.dart';
import '../models/festival_model.dart';

// A class to hold static route names for easy access.
abstract class AppRoutes {
  late final Festival festival;
  static const splash = '/';
  static const home = '/home';
  static const userRegister="/register";
  static const userLogin="/login";
  static const calender="/calender";
  static const festivalList = '/festival';
  static const festivalDetails = '/festivals/details';
  static const panditBooking = '/pandit-booking';
  static const mantra="/mantras";
  static const bookseva1="/bookseva1";
  static const bookseva2="/bookseva2";
  static const panditDetails="/panditDetails";
  static const pooja="/pooja";
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

    GetPage(
        name: AppRoutes.userRegister,
        page:()=> RegistrationPage()),

    GetPage(
        name: AppRoutes.userLogin,
        page:()=> UserLoginPage()),

    GetPage(
      name: AppRoutes.festivalList,
      page: () =>  FestivalListView(),
      binding: FestivalBinding(),
    ),
    GetPage(
      name: AppRoutes.festivalDetails,
      page: () => FestivalDetailView(),
      binding: FestivalDetailBinding(),
    ),

    GetPage(
      name: AppRoutes.panditBooking,
      page: () => PanditBookingView(),
    ),


    GetPage(
      name: AppRoutes.bookseva1,
      page: () => BookSevaPage1(),
    ),

    GetPage(
      name: AppRoutes.bookseva2,
      page: () => BookSevaPage2(),
    ),

    GetPage(
      name: AppRoutes.panditDetails,
      page: () => PanditDetailView(),
    ),

    GetPage(
      name: AppRoutes.mantra,
      page: () => MantraView(),
    ),

    GetPage(
      name: AppRoutes.pooja,
      page: () => PoojaView(),
    ),

    GetPage(
      name: AppRoutes.calender,
      page: () => CalendarView(),
    ),

  ];
}
