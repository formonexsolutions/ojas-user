import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:ojas_app/Screens/Pandit_Booking/pandit_booking_history.dart';
import 'package:ojas_app/Utils/custom_appbar/custome_appbar.dart';

class BookingAndPayment extends StatefulWidget {
  final String priestname;
  final String priestemail;
  final DateTime date;
  final String time;
  final String poojatype;

  const BookingAndPayment({
    super.key,
    required this.priestname,
    required this.priestemail,
    required this.date,
    required this.time,
    required this.poojatype,
  });

  @override
  State<BookingAndPayment> createState() => _BookingAndPaymentState();
}

class _BookingAndPaymentState extends State<BookingAndPayment> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController instructionController = TextEditingController();

  String paymentMethod = "Credit/Debit Card";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final box = GetStorage();
    String? email = box.read('email');
    String? username=box.read("name");
    return Scaffold(
      appBar: CustomAppBar(
          title: "Book Priest",
          screenWidth: Get.width,
          showBack: true
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 10),

            /// Required Details
            const Text("Required Details", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Devotee Name",
                style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Devotee Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const Text("Contact Number",
                style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            TextField(
              controller: contactController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Contact Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const Text("Email Address",
                style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email Address",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const Text("Special Instructions (Optional)",
                style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            TextField(
              controller: instructionController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: "Any Special Instructions ",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            /// Payment Options
            const Text("Select Payment Method",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            RadioListTile(
              value: "Credit/Debit Card",
              groupValue: paymentMethod,
              onChanged: (value) => setState(() => paymentMethod = value!),
              title: const Text("Credit/Debit Card"),
              secondary: const Icon(Icons.credit_card, color: Colors.orange),
            ),
            RadioListTile(
              value: "UPI",
              groupValue: paymentMethod,
              onChanged: (value) => setState(() => paymentMethod = value!),
              title: const Text("UPI"),
              secondary: const Icon(Icons.account_balance_wallet, color: Colors.orange),
            ),
            RadioListTile(
              value: "Net Banking",
              groupValue: paymentMethod,
              onChanged: (value) => setState(() => paymentMethod = value!),
              title: const Text("Net Banking"),
              secondary: const Icon(Icons.account_balance, color: Colors.orange),
            ),
            RadioListTile(
              value: "Mobile Wallets",
              groupValue: paymentMethod,
              onChanged: (value) => setState(() => paymentMethod = value!),
              title: const Text("Mobile Wallets"),
              secondary: const Icon(Icons.phone_iphone, color: Colors.orange),
            ),

            const SizedBox(height: 20),

            /// Total + Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Total Amount", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("₹500", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: screenWidth,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    // Format date (eg: 28 Aug 2025)
                    String formattedDate = DateFormat("dd MMM yyyy").format(widget.date);

                    // Format time (eg: 02:00 PM)
                    String formattedTime = DateFormat("hh:mm a").format(widget.date);

                    await FirebaseFirestore.instance.collection("bookings").add({
                      "poojaType": widget.poojatype,
                      "priestName": widget.priestname,
                      "priestEmail":widget.priestemail,
                      "useremail":email,
                      "username": username,
                      "date": formattedDate,
                      "time": formattedTime,
                      "devoteeName": nameController.text.trim(),
                      "contactNumber": contactController.text.trim(),
                      "email": emailController.text.trim(),
                      "instructions": instructionController.text.trim(),
                      "paymentMethod": paymentMethod,
                      "amount": 500,
                      "createdAt": FieldValue.serverTimestamp(),
                      "status":"pending"
                    });

                    Get.snackbar("Booking Confirmed", "Your booking has been submitted ✅",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green.withOpacity(0.8),
                      colorText: Colors.white,
                    );
                    Get.to(()=>UserBookingHistory());
                    // Clear fields after booking
                    nameController.clear();
                    contactController.clear();
                    emailController.clear();
                    instructionController.clear();

                  } catch (e) {
                    Get.snackbar("Error", "Something went wrong: $e",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red.withOpacity(0.8),
                      colorText: Colors.white,
                    );
                  }
                },


                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Book Seva", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 10),
            const Text("* Seva cannot be cancelled or modified after booking",
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
