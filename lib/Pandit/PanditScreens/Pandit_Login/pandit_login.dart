import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojas_app/Utils/custom_button.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../PanditControllers/Pandit_AuthController/pandit_authController.dart';

class PanditLoginPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final PanditAuthController authController = Get.put(PanditAuthController());
  @override
  Widget build(BuildContext context) {

    final screenWidth=Get.width;
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child:
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenWidth *0.2,),
                Container(
                  alignment: Alignment.center,
                  height: screenWidth * 0.5,
                  child: Image.asset("assets/splash/pandit.png"),
                ),

                Center(
                  child: Text(
                    'Pandit Login',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(height: screenWidth *0.10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Let's Get Started",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),),
                    // SizedBox(height: screenWidth *0.1,),
                    Text("Sign in your account",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFBCBCBC),

                            fontWeight: FontWeight.w300),
                      ),)
                  ],
                ),

                SizedBox(height: screenWidth *0.05,),
                Text("Email Or Mobile"),
                _buildField(
                    'example@gmail.com',
                    controller: _emailController,
                    validator: _validateEmail),
                SizedBox(height: screenWidth *0.05,),
                Text("Password"),
                _buildPassword(
                  "Password",
                  controller: _passwordController,
                  validator: _validatePassword,),
                SizedBox(height: screenWidth *0.05,),

                Obx(() {
                  if (authController.isLoading.value) {
                    return CircularProgressIndicator();
                  }
                  return CustomButton(
                    text: "Login",
                    //color: Colors.orange,
                    width: MediaQuery.of(context).size.width,
                    onPressed: ()=>authController.Panditlogin(
                        _emailController.text.trim(),
                        _passwordController.text.trim()),

                  );

                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: screenWidth *0.04,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),),
                    TextButton(
                      onPressed: () => Get.toNamed('/pandit-register'),
                      child: Text('Sign Up',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Color(0xFFF2921B),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(
      String hint, {
        required TextEditingController controller,
        bool obscure = false,
        Widget? suffix,
        TextInputType? keyboard,
        VoidCallback? toggleObscure,
        FormFieldValidator<String>? validator,
      }) {
    return  TextFormField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
        //prefixIcon: Icon(icon, color: Colors.orange.shade700),
        hintText: hint,
        filled: true,
        fillColor: Color(0xFFF8F8F8),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFF2921B), width: 2),
        ),
        suffixIcon: suffix,
      ),
    );
  }

  Widget _buildPassword(
      String hint, {
        required TextEditingController controller,
        bool obscure = false,
        Widget? suffix,
        TextInputType? keyboard,
        VoidCallback? toggleObscure,
        FormFieldValidator<String>? validator,
      }) {
    return Obx(()=> TextFormField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: authController.isPasswordHidden.value,
      validator: validator,
      decoration: InputDecoration(
        //prefixIcon: Icon(icon, color: Colors.orange.shade700),
        hintText: hint,
        filled: true,
        fillColor: Color(0xFFF8F8F8),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFF2921B), width: 2),
        ),
        suffixIcon: IconButton(
          icon: Icon(authController.isPasswordHidden.value
              ? Icons.visibility_off
              : Icons.visibility),
          onPressed: authController.togglePasswordVisibility,
        ),
      ),
    ) );
  }



  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) return 'Enter a valid email';
    return null;
  }
  String? _validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter mobile number';
    }
    final pattern = r'^(?:[+0]9)?[0-9]{10,12}$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }

  String? _validateAddress(String? value){
    if (value == null || value.isEmpty) return 'Please enter address';
  }
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter password';
    if (value.length < 6) return 'Minimum 6 characters';
    final hasNumber = RegExp(r'\d').hasMatch(value);
    final hasUpper = RegExp(r'[A-Z]').hasMatch(value);
    if (!hasNumber || !hasUpper) return 'Include uppercase & number';
    return null;
  }
}
