import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../Controllers/Book_TempleSeva_Controller/book_templeseva_controller.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/custom_appbar/custome_appbar.dart';


class BookSevaPage2 extends StatelessWidget {
  final BookSevaController controller = Get.put(BookSevaController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Book Seva",
        screenWidth: Get.width,
        showBack: true,
        showActions: true,
      ),
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Morning Aarti Seva",
                style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text("₹500",
                style: TextStyle(fontSize: 18, color: Colors.orange)),
            SizedBox(height: 16),

            // 📅 Date Picker
            Text("Select Date",
                style:
                TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: controller.selectedDate.value,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  controller.selectedDate.value = picked;
                }
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Text(DateFormat('dd MMM yyyy')
                        .format(controller.selectedDate.value))),
                    Icon(Icons.calendar_today, color: Colors.orange),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Form Fields
            _buildTextField(
                "Devotee Name", (val) => controller.devoteeName.value = val),
            _buildTextField("Contact Number",
                    (val) => controller.contactNumber.value = val,
                keyboardType: TextInputType.phone),
            _buildTextField("Email Address",
                    (val) => controller.email.value = val,
                keyboardType: TextInputType.emailAddress),
            _buildTextField(
                "Special Instructions (Optional)",
                    (val) => controller.specialInstructions.value = val),

            SizedBox(height: 20),

            // Payment Options
            Text("Select Payment Method",
                style:
                TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Obx(() => Column(
              children: [
                _paymentOption("Credit/Debit Card"),
                _paymentOption("UPI"),
                _paymentOption("Net Banking"),
                _paymentOption("Mobile Wallets"),
              ],
            )),

            SizedBox(height: 20),

            // Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Amount",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text("₹500",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange)),
              ],
            ),
            SizedBox(height: 20),

            // Book Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.bookSeva,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text("Book Seva",
                    style:
                    TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),

            SizedBox(height: 10),

            Text(
                "* Seva cannot be cancelled or modified after booking. Receipt will be sent to your email.",
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      )),
    );
  }

  Widget _buildTextField(String hint, Function(String) onChanged,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onChanged: onChanged,
      ),
    );
  }

  Widget _paymentOption(String method) {
    final controller = Get.find<BookSevaController>();
    return RadioListTile<String>(
      value: method,
      groupValue: controller.selectedPayment.value,
      onChanged: (value) {
        controller.selectedPayment.value = value!;
      },
      title: Text(method),
      activeColor: Colors.orange,
    );
  }
}
