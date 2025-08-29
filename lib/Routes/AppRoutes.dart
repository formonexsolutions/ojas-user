import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Bindings/binding.dart';
import '../Controllers/TempleController/temple_controller.dart';
import '../Login/SplashScreens/SplashScreen1.dart';
import '../Pandit/PanditScreens/Pandit_HomePanel/pandit_homePage.dart';
import '../Pandit/PanditScreens/Pandit_Login/pandit_login.dart';
import '../Pandit/PanditScreens/Pandit_Login/pandit_signup.dart';
import '../Screens/Aarati/aarati.dart';
import '../Screens/Calender/calender.dart';
import '../Screens/Donation/donation.dart';
import '../Screens/Festivals/festival_details.dart';
import '../Screens/Festivals/festival_list.dart';
import '../Screens/Homepanel/Homepage.dart';
import '../Screens/Mantra/mantra.dart';
import '../Screens/Pandit_Booking/pandit_booking.dart';
import '../Screens/Pandit_Booking/pandit_booking_history.dart';
import '../Screens/Pandit_Booking/pandit_details.dart';
import '../Screens/Pandit_Booking/pandit_list.dart';
import '../Screens/Pooja/pooja.dart';
import '../Screens/PriestBooking/priest_detailed.dart';
import '../Screens/Temple/book_seva/book_seva.dart';
import '../Screens/Temple/book_seva/book_templeseva.dart';
import '../Screens/Temple/temple_details.dart';
import '../Screens/Testing/test2.dart';
import '../Screens/Testing/test3.dart';
import '../Screens/User_Login/user_login.dart';
import '../Screens/User_Login/user_otp.dart';
import '../Screens/User_Login/user_registration.dart';
import '../models/festival_model.dart';
import 'package:get/get.dart';
// A class to hold static route names for easy access.
abstract class AppRoutes {
  late final Festival festival;
  static const splash = '/';
  static const home = '/home';
  static const userRegister="/register";
  static const otp="/otp";
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
  static const aarati="/aarati";
  static const donation="/donation";
  static const panditlist="/pandit-list";
  static const poojatype="/pooja-type";
  static const priestDetailed="/priest-detailed";
  static const templeDetails="/temple-detail";
static const usebookingHistory="/user-booking-history";
  // 2. Pandit
static const panditregister="/pandit-register";
static const panditlogin="/pandit-login";
static const pandithome="/pandit-home";

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
      name: AppRoutes.bookseva1,
      page: () => BookSevaPage1(),
    ),

    GetPage(
      name: AppRoutes.bookseva2,
      page: () => BookSevaPage2(),
    ),

    // GetPage(
    //   name: AppRoutes.panditDetails,
    //   page: () => PanditDetailView(pandit: null,),
    // ),

    GetPage(
      name: AppRoutes.mantra,
      page: () => MatraAartiView(),
    ),

    GetPage(
      name: AppRoutes.pooja,
      page: () => PoojaView(),
    ),

    GetPage(
      name: AppRoutes.calender,
      page: () => CalendarView(),
    ),
    GetPage(
      name: AppRoutes.aarati,
      page: () => AartiView(),
    ),

    GetPage(
      name: AppRoutes.panditlist,
      page: () => PanditListPage1(),

    ),

    GetPage(
      name: AppRoutes.donation,
      page: () => DonationPage(),
    ),




    GetPage(
      name: '/temple-detail',
      page: () {
        final args = Get.arguments as Map<String, dynamic>;
        return TempleDetailPage(
          imageUrl: args['imageUrl'],
          title: args['title'],
          disc: args["disc"],
        );
      },
      binding: BindingsBuilder(() {
        Get.put(TempleController2());
      }),
    ),


      GetPage(
         name: AppRoutes.usebookingHistory,
         page: () =>UserBookingHistory(),

     ),



    // 2.Pandit

    GetPage(name: AppRoutes.panditregister,
        page:()=> PanditSignupPage()),
    GetPage(name: AppRoutes.panditlogin,
        page:()=> PanditLoginPage()),
    GetPage(name: AppRoutes.pandithome,
        page: ()=>PanditHomePage()),
  ];
}
