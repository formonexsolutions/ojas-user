class SevaModel {
  String devoteeName;
  String contactNumber;
  String email;
  String specialInstructions;
  String paymentMethod;
  DateTime sevaDate;
  int amount;

  SevaModel({
    required this.devoteeName,
    required this.contactNumber,
    required this.email,
    this.specialInstructions = '',
    required this.paymentMethod,
    required this.sevaDate,
    this.amount = 500,
  });

  Map<String, dynamic> toJson() {
    return {
      "devoteeName": devoteeName,
      "contactNumber": contactNumber,
      "email": email,
      "specialInstructions": specialInstructions,
      "paymentMethod": paymentMethod,
      "sevaDate": sevaDate.toIso8601String(),
      "amount": amount,
    };
  }
}
