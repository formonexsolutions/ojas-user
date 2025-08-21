// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../Controllers/Auth_Controller/auth_controller.dart';
//
//
// class OtpScreen extends StatelessWidget {
//   final controller = Get.find<AuthController>();
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController otpController=TextEditingController();
//     return Scaffold(
//       appBar: AppBar(title: Text('Verify OTP')),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               controller: controller.otpController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Enter OTP'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: controller.verifyOtp(otpController),
//               child: Text('Verify'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
