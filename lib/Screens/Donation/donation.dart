import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ojas_app/Utils/custom_appbar/custome_appbar.dart';

class DonationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();
    return Scaffold(
      appBar: CustomAppBar(
          title: "Donation",
          screenWidth: Get.width,
      showBack: true,),
    );
  }

}