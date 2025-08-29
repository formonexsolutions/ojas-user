import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/custom_appbar/custome_appbar.dart';


class BookSevaPage1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();

    final screenWidth = Get.width;
    int crossAxisCount = 3;
    double iconSize = screenWidth * 0.15;
    double fontSize = screenWidth * 0.035;
    double spacing = screenWidth * 0.04;
    double padding = screenWidth * 0.04;
    double iconTextSpacing = screenWidth * 0.02;

    return Scaffold(
        appBar: CustomAppBar(
      title: "Priest List",
      screenWidth: Get.width,
      showBack: true,
          showActions: true,
    ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter your location",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFFFBEB),
              ),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.warning_amber,color:Color(0xFFD97706) ,),
                  SizedBox(width: 10,),
                  Expanded(child: Text("Please Note: Only one Seva can be selected at a time",
                  style: TextStyle(
                      fontWeight:FontWeight.bold,
                      color: Color(0xFFD97706)),))
                ],
              ),
            ),
            SizedBox(height: 10,),
            Card(child: ListTile(
              onTap: (){
                Get.offAllNamed('/bookseva2');
              },
              title: Text("Morning Archana",
              style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Special morning prayer ritual"),
                  Row(
                    children: [
                      Icon(Icons.access_time,),
                      Text("30min . 251"),
                    ],
                  )
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.orange,),
            )),
            Card(child: ListTile(
              onTap: (){},
              title: Text("Abhishekam",
                style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sacrate bathing ceremony"),
                  Row(
                    children: [
                      Icon(Icons.access_time,),
                      Text("45min . 501"),
                    ],
                  )
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.orange,),
            )),
            Card(child: ListTile(
              onTap: (){},
              title: Text("Sahasranama  Archana",
                style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Recitation of 1008 names"),
                  Row(
                    children: [
                      Icon(Icons.access_time,),
                      Text("60min . 1001"),
                    ],
                  )
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.orange,),
            )),
            Card(child: ListTile(
              onTap: (){},
              title: Text("Pushpa Seva",
                style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Flower offering ceremony"),
                  Row(
                    children: [
                      Icon(Icons.access_time,),
                      Text("60min . 151"),
                    ],
                  )
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.orange,),
            ))
          ],
        ),
      ),
    );
  }

}