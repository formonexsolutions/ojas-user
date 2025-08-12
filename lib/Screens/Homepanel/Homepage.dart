import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../Controllers/HomepanelControllers/HomeController.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final HomeController controller = Get.find<HomeController>();

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
  final List<String> carouselImages = [
    'assets/home/pooja.jpg',
    'assets/home/pooja.jpg',
    'assets/home/pooja.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;

    int crossAxisCount = 3;
    double iconSize = screenWidth * 0.15;
    double fontSize = screenWidth * 0.035;
    double spacing = screenWidth * 0.04;
    double padding = screenWidth * 0.04;
    double iconTextSpacing = screenWidth * 0.02;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ojas App Home'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Carousel/Image Slider Section
              CarouselSlider(
                options: CarouselOptions(
                  height: screenWidth * 0.5,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.9,
                ),
                items: carouselImages.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(item),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              SizedBox(height: spacing * 1.5),

              // 2. Main Service Grid Section
              Text(
                'Our Services',
                style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: spacing),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  childAspectRatio: 1.0,
                ),
                itemCount: controller.homeItems.length,
                itemBuilder: (context, index) {
                  final item = controller.homeItems[index];
                  return GestureDetector(
                    onTap: () => controller.onItemSelected(item['route']!),
                    child: Card(
                      color: cardColors[index % cardColors.length],
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
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
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: spacing * 1.5),

              // 3. "Shop Online" Banner Section
              Text(
                'Shop Online',
                style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: spacing),
              Container(
                height: screenWidth * 0.3,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: const Color(0xFFFDEBE7),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Pooja Merchandise',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFB15F29),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Donation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.deepPurple,
        onTap: (index) {
          // Handle navigation here
        },
      ),
    );
  }
}