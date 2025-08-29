import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Controllers/Festival_Controller/festival_controller.dart';
import '../../Controllers/HomepanelControllers/HomeController.dart';
import '../../Controllers/TempleController/temple_card.dart';
import '../../Controllers/TempleController/temple_controller.dart';
import '../../Routes/AppRoutes.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/custom_appbar/custome_appbar.dart';
import '../../models/festival_model.dart';
import '../Temple/temple_details.dart';
import '../../models/temple_model.dart';
import '../Testing/test1.dart';



class CarouselController extends GetxController {
  var currentIndex = 0.obs;

  void pageChanged(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }
}

class Temple {
 final String title;
  final String images;

  Temple({
   required this.title,
    required this.images,
});
}


class HomeView extends StatelessWidget {


  final HomeController controller = Get.find<HomeController>();

  final PageController _controller = PageController(viewportFraction: 0.8);
  final FestivalController _fcontroller = Get.find<FestivalController>();
  final TempleController2 tcontroller = Get.put(TempleController2());


  // A list of background colors for the cards
  final List<Color> cardColors = [
    const Color(0xFFFDE7F3), // Light pink
    const Color(0xFFF3E7FD), // Light purple
    const Color(0xFFFDEBE7), // Light orange
    const Color(0xFFE7FDFD), // Light cyan
    const Color(0xFFE7FDE7), // Light green
    const Color(0xFFFDFFE7), // Light yellow
  ];



  // A list of sample images for the carousel
  final List<Temple> carouselImages = [
    Temple(
        title: "Shree Saminarayan Mandir",
        images: 'assets/temples/temple1.jpg',
    ),

    Temple(
      title: "Shree Ganesh Mandir",
      images: 'assets/temples/temple2.jpg',
    ),
    Temple(
      title: "Shree Mahadev Temple",
      images: 'assets/temples/temple3.jpg',
    )
  ];

  final List<Map<String, String>> items = const [
    {
      'url':"assets/temples/temple1.jpg",
      'title': 'Shree Ganesh Mandir',
      "disc":
      "he Tirupati Balaji temple, also known as Sri Venkateswara Swami Temple, is a renowned Hindu temple located in Tirumala, Andhra Pradesh, India. It is dedicated to Lord Venkateswara, a form of Vishnu, and is a major pilgrimage destination. ",
    },
    {
      'url':"assets/temples/temple2.jpg",
      'title': 'Dagadushth Ganapati',
      "disc":
      "The Dagadusheth Halwai Ganapati Temple is a Hindu temple dedicated to the Hindu god Ganesha in the city of Pune, India. The temple is visited by over one hundred thousand devotees every year. A large number of devotees visit the temple during the annual ten-day public Ganeshotsav festival",
    },
    {
      "url":"assets/temples/temple3.jpg",
      "title": "Mahadev",
      "disc":
      "A small temple with a huge compound on top of a small hill should not be given a miss. As usual, i was browsing around on google maps (in satellite view) around my favourite area (the hills near to Saswad). Curvy roads on a hill terrain, interesting. Zoomed in and found a temple. Never been there, time to go!",
    },
  ];
  final controller1 = PageController();
  final List<String> imageUrls = const [
    'data:image/jpeg;base64,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',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8sYMzymxiMt7m8ySO9jF3dMmUJ89w4gAEJFMNwVzUbjSO_eTyCTzVYOZlevEq3mpBUSE&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkxVITLRjpVeVozYNoHvsjFxSqfyU0wyXgRefM1VIjgQJJNYJcClVx95Ho30gwCBQbQLY&usqp=CAU',
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {

    final screenWidth = Get.width;
    int crossAxisCount = 3;
    double iconSize = screenWidth * 0.15;
    double fontSize = screenWidth * 0.035;
    double spacing = screenWidth * 0.03;
    double padding = screenWidth * 0.04;
    double iconTextSpacing = screenWidth * 0.02;
    final c = Get.put(CarouselController());

    final box = GetStorage();
    String? email = box.read('email');
    String? name = box.read('name');
    String? mobile=box.read("mobile");
    String? id=box.read("id");
    final User? user = FirebaseAuth.instance.currentUser;

    final smcontroller = PageController(viewportFraction: 0.8, keepPage: true);
    return
      LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;
            return Scaffold(
              appBar: CustomAppBar(
                title: "Ojas",
                screenWidth: Get.width,
                // showBack: true,
                showActions: true,
                showBack: false,
              ),
              drawer: Drawer(
                child: ListView(
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        // color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: UserAccountsDrawerHeader(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange
                        ),
                        currentAccountPicture: CircleAvatar(),
                        currentAccountPictureSize: Size.square(50),
                        accountName: name != null ? Text(name) : Text("user"),
                        accountEmail: Text(email!),
                      )
                      ,),

                    ListTile(
                      leading: Icon(
                        Icons.calendar_month, color: Colors.orange,),
                      title: Text("Calender"),
                      onTap: () => Get.offAllNamed("/calender"),
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.festival_outlined, color: Colors.orange,),
                      title: Text("Festivals"),
                      onTap: () {
                        // ✅ Pass the *model* itself as GetX argument
                        Get.toNamed(AppRoutes.festivalList);
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.login, color: Colors.orange,),
                      title: Text("Pandit Login"),
                      onTap: () {
                        // ✅ Pass the *model* itself as GetX argument
                        Get.toNamed("/pandit-login");
                      },
                    ),
                ListTile(
                leading: Icon(Icons.history, color: Colors.orange,),
                title: Text("User Booking History"),
                   onTap: () {
            // ✅ Pass the *model* itself as GetX argument
                    Get.toNamed("/user-booking-history");
                 },),

                    ListTile(
                      leading: Icon(Icons.login, color: Colors.orange,),
                      title: Text("Pandit detailed"),
                      onTap: () {
                        // ✅ Pass the *model* itself as GetX argument
                        Get.toNamed("/priest-detailed");
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.music_note, color: Colors.orange,),
                      title: Text("PanditList"),
                      onTap: () {
                        // ✅ Pass the *model* itself as GetX argument
                        Get.offAllNamed("/pandit-list");
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.music_note, color: Colors.orange,),
                      title: Text("Aarati"),
                      onTap: () {
                        // ✅ Pass the *model* itself as GetX argument
                        Get.offAllNamed("/aarati");
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.music_note, color: Colors.orange,),
                      title: Text("Mantra"),
                      onTap: () {
                        // ✅ Pass the *model* itself as GetX argument
                        Get.offAllNamed("/mantras");
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.music_note, color: Colors.orange,),
                      title: Text("Pooja"),
                      onTap: () {
                        // ✅ Pass the *model* itself as GetX argument
                        Get.offAllNamed("/pooja");
                      },
                    ),


                    ListTile(
                      leading: Icon(Icons.book_online, color: Colors.orange,),
                      title: Text("Book Seva"),
                      onTap: () {
                        // ✅ Pass the *model* itself as GetX argument
                        Get.offAllNamed("/bookseva1");
                      },
                    ), ListTile(
                      leading: Icon(Icons.group, color: Colors.orange,),
                      title: Text("Donation"),
                      onTap: () {
                        // ✅ Pass the *model* itself as GetX argument
                        Get.offAllNamed("/donation");
                      },
                    ),


                    ListTile(
                      leading: Icon(Icons.person, color: Colors.orange,),
                      title: Text("Profile"),
                      onTap: () {
                        // ✅ Pass the *model* itself as GetX argument
                        //Get.offAllNamed("/festival");
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings, color: Colors.orange,),
                      title: Text("Settings"),
                      onTap: () {
                        // ✅ Pass the *model* itself as GetX argument
                        //Get.offAllNamed("/festival");
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.help, color: Colors.orange,),
                      title: Text("Help"),
                      onTap: () {
                        // ✅ Pass the *model* itself as GetX argument
                        //Get.offAllNamed("/festival");
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.login_outlined, color: Colors.orange,),
                      title: Text("Logout"),
                      onTap: () {
                        // ✅ Pass the *model* itself as GetX argument
                        //Get.offAllNamed("/festival");
                      },
                    )


                  ],
                ),
              ),
              body: SingleChildScrollView(

                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: spacing),

                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Temples',
                              style: TextStyle(
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.appbar_bgColor
                              ),
                            ),
                            const SizedBox(height: 10,),
                            CarouselSlider.builder(
                              itemCount: items.length,
                              itemBuilder: (context, index, realIdx) {
                                final item = items[index];
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(()=>TempleDetailPage(
                                      imageUrl: item['url']!,
                                      title: item['title']!,
                                      disc: item["disc"]!,));
                                  },
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          child:
                                          Container(
                                            width: screenWidth *0.75,
                                            alignment: Alignment.bottomLeft,
                                            height: screenWidth *0.1,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(item["url"]!))
                                            ),
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  bottom:20,
                                                  left: 10,
                                                  child: Text(
                                                    item['title']!,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                onPageChanged: c.pageChanged,
                                height: screenWidth * 0.4,
                                viewportFraction: 0.7,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 5),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Obx(() => Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  carouselImages.length,
                                      (index) => Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 4),
                                    height: 6,
                                    width: c.currentIndex.value == index ? 30 : 12, // active vs inactive
                                    decoration: BoxDecoration(
                                      color: c.currentIndex.value == index
                                          ? AppColors.appbar_bgColor // active color
                                          : Colors.grey[500],             // inactive color
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                            // PageView of cards

                          ],
                        ),
                      ),

                      // 2. Main Service Grid Section

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Features',
                            style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.w500,
                                color: AppColors.appbar_bgColor
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.festivalList);
                              },
                              icon: Icon(Icons.arrow_forward_ios,
                                size: screenWidth * 0.05,
                                color: AppColors.appbar_bgColor,))
                        ],
                      ),

                      // SizedBox(height: spacing),

                      SizedBox(
                        height: 100, // adjust height as per your card size
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal, // 👈 makes it horizontal scroll
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, // only 1 row visible at a time
                            childAspectRatio:1, // adjust aspect ratio of card
                            mainAxisSpacing: 5,
                          ),
                          itemCount: controller.homeItems.length > 3
                              ? 6
                              : controller.homeItems.length, // 👈 max 3 cards
                          itemBuilder: (context, index) {
                            final item = controller.homeItems[index];
                            return GestureDetector(
                              onTap: () => controller.onItemSelected(item['route']!),
                              child: Card(
                                color: cardColors[index % cardColors.length],
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      item['icon']!,
                                      height: iconSize,
                                      width: iconSize,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(height: iconTextSpacing),
                                    Text(
                                      item['title']!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: fontSize,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                        SizedBox(height: 20,),
                      // 3. "Shop Online" Banner Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Temple Events & Festivals',
                            style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.w500,
                                color: AppColors.appbar_bgColor
                            ),
                          ),

                          IconButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.festivalList);
                              },
                              icon: Icon(Icons.arrow_forward_ios,
                                size: screenWidth * 0.05,
                                color: AppColors.appbar_bgColor,))
                        ],
                      ),
                      // SizedBox(height: spacing),
                      SizedBox(
                        height: 250,
                        child: PageView.builder(
                          controller: _controller,
                          itemCount: _fcontroller.festivals.length,
                          itemBuilder: (context, index) {
                            final f = _fcontroller.festivals[index];
                            return FestivalCard(
                              imageUrl: f.image,
                              title: f.name,
                              date: f.date,
                              location: "Pune",
                              onTap: () {
                                Get.toNamed(AppRoutes.festivalDetails, arguments: f);
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
            );
          });
  }
}