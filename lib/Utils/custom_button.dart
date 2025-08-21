import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 50,
    this.borderRadius = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final btncolor =Color(0xFFF2921B);
    return SizedBox(
      width: width,
      height: screenWidth *0.15,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: btncolor,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style:  GoogleFonts.poppins(
          fontSize: screenWidth * 0.055,
          fontWeight: FontWeight.w700,
            color: textColor,
        ),
      ),
      )
    );
  }
}
