import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final bool showActions;
  final double screenWidth;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.screenWidth,
   // this.showBack = true,
    this.showActions = true, required this.showBack,
  });

  @override
  Size get preferredSize => Size.fromHeight(screenWidth * 0.2);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: screenWidth * 0.7,
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: screenWidth * 0.06,
          fontWeight: FontWeight.w700,
          color: AppColors.appbar_titleColor,
        ),
      ),

      iconTheme: IconThemeData(
        color: Colors.white, // change drawer icon color
      ),
      leading: showBack
          ? IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back_ios_new,
          size: screenWidth * 0.07,
          color: AppColors.appbar_titleColor,
        ),
      )
          : null,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      centerTitle: true,
      backgroundColor: AppColors.appbar_bgColor,
      actions: showActions
          ? [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
            size: screenWidth * 0.07,
            color: AppColors.appbar_titleColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border_rounded,
            size: screenWidth * 0.07,
            color: AppColors.appbar_titleColor,
          ),
        ),
      ]
          : null,
    );
  }
}
