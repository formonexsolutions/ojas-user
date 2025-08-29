import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojas_app/Utils/custom_button.dart';

import '../../../Screens/Pandit_Booking/pandit_booking_history.dart';

class PanditHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text("PanditHomePage"),
        leading: IconButton(onPressed: (){
          Get.back();
        },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body:
      SingleChildScrollView(
        padding:  const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomButton (
                text: "Bookings",
                onPressed:  ()async{
                  await Get.to(()=>UserBookingHistory());
                }
            )
          ],
        ),
      ),
    );
  }

}