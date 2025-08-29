import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ojas_app/Utils/custom_button.dart';
import 'package:random_string/random_string.dart';
import '../../Controllers/Auth_Controller/auth_controller.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenWidth * 0.05),
                Center(
                  child: Text(
                    'Register',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.05),

                Text(
                  "Let's Get Started",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Create an account",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Color(0xFFBCBCBC),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: screenWidth * 0.03),

                // Full name
                Text("Full Name"),
                _buildField(
                  'Ex. John Shelby',
                  controller: _fullNameController,
                  validator: _validateUsername,
                ),
                SizedBox(height: screenWidth * 0.03),

                // Email
                Text("Email"),
                _buildField(
                  'Email Id',
                  controller: _emailController,
                  validator: _validateEmail,
                ),
                SizedBox(height: screenWidth * 0.03),

                // Mobile
                Text("Mobile"),
                _buildField(
                  'Mobile',
                  controller: _mobileController,
                  validator: _validateMobile,
                ),
                SizedBox(height: screenWidth * 0.03),
                // Password
                Text("Create Password"),
                _buildPassword(
                  "Password",
                  controller: _passwordController,
                  validator: _validatePassword,
                ),
                SizedBox(height: screenWidth * 0.03),

                // Register button
                Obx(() {
                  if (authController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return CustomButton(
                    text: "Register",
                    width: MediaQuery.of(context).size.width,
                    height: screenWidth * 0.10,
                    onPressed: () {
                      String id = randomAlphaNumeric(10);
                      if (_formKey.currentState!.validate()) {
                        authController.registerUser(
                          id: id,
                          mobile: _mobileController.text.trim(),
                          name: _fullNameController.text.trim(),
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );
                      }
                    },
                  );
                }),
                SizedBox(height: screenWidth * 0.05),

                // Already have account?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed('/login'),
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.04,
                          color: Color(0xFFF2921B),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- TextField Builder ---
  Widget _buildField(
      String hint, {
        required TextEditingController controller,
        bool obscure = false,
        Widget? suffix,
        TextInputType? keyboard,
        FormFieldValidator<String>? validator,
      }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
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

  // --- Password Field ---
  Widget _buildPassword(
      String hint, {
        required TextEditingController controller,
        FormFieldValidator<String>? validator,
      }) {
    return Obx(
          () => TextFormField(
        controller: controller,
        obscureText: authController.isPasswordHidden.value,
        validator: validator,
        decoration: InputDecoration(
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
      ),
    );
  }

  // --- Validators ---
  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your username';
    if (value.length < 3) return 'Minimum 3 characters';
    return null;
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
    final pattern = r'^[0-9]{10}$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid 10-digit mobile number';
    }
    return null;
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
