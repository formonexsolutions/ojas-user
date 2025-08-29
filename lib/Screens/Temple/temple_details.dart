import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Utils/custom_appbar/custome_appbar.dart';

class TempleDetailPage extends StatelessWidget {
   final String disc;
  final String imageUrl;
  final String title;


  const TempleDetailPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.disc,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    int crossAxisCount = 3;
    double iconSize = screenWidth * 0.15;
    double fontSize = screenWidth * 0.035;
    double spacing = screenWidth * 0.04;
    double padding = screenWidth * 0.04;
    double iconTextSpacing = screenWidth * 0.02;

    return DefaultTabController(length: 3,
        child:
      Scaffold(
        appBar: CustomAppBar(
          title: "Priest List",
          screenWidth: Get.width,
          showBack: true,
          showActions: true,
        ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
           child: Container(
             height: screenWidth * 0.5,
             width: screenWidth,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               image: DecorationImage(
                 fit: BoxFit.cover,
                   image: AssetImage(imageUrl))
             ),
           ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$title",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
                SizedBox(height: 05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on_outlined,color: Colors.orange,size: 15,),
                    Text("Kensington,Maryland")
                  ],
                ),
                SizedBox(height: 05,),
                _IconStar(),
              ],
            ),
          ),
          TabBar(
            labelColor: const Color(0xFFFFA000),
            unselectedLabelColor: Colors.grey,
            indicatorColor: const Color(0xFFFFA000),
            tabs: [
              Tab(text: 'About Temple'),
              Tab(text: 'Donate'),
              GestureDetector(
                onTap: (){
                  Get.offAllNamed('/bookseva1');
                },
                  child: Tab(text: 'Seva Options')),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _AboutTabContent(),
                Center(child: Text('Donate page content here')),
                Center(child: Text('Seva options content here')),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     'Details: "$disc"',
          //     style: const TextStyle(fontSize: 16),
          //   ),
          // ),
        ],
      ),
      )
    );
  }

  Widget _IconStar(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.star,color: Colors.orange,size: 15,),
        Icon(Icons.star,color: Colors.orange,size: 15,),
        Icon(Icons.star,color: Colors.orange,size: 15,),
        Icon(Icons.star,color: Colors.orange,size: 15,),
        Icon(Icons.star,color: Colors.orange,size: 15,),
        Text("(4.8)"),
      ],
    );
  }
}


class _AboutTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('About Temple',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text(
          'Sri Krishna Temple, established in 1950, is a historic place of worship dedicated to Lord Krishna. The temple is known for its architectural beauty and spiritual significance.',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 16),
        Text('Opening Hours',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.access_time, color: Colors.orange),
            SizedBox(width: 8),
            Text('6:00 AM – 9:00 PM'),
          ],
        ),
        SizedBox(height: 16),
        Text('Important Dates',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.calendar_today, color: Colors.orange),
            SizedBox(width: 8),
            Expanded(child: Text('Jan 15 – Makar Sankranti Festival')),
          ],
        ),
      ],
    );
  }
}
