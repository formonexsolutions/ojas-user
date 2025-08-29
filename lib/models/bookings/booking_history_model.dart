class BookingHistoryModel {
  final String id;
  final String poojaType;
  final String priestName;
  final String date;
  final String time;
  final String amount;
  final String? specialInstructions;

  BookingHistoryModel({
    required this.id,
    required this.poojaType,
    required this.priestName,
    required this.date,
    required this.time,
    required this.amount,
    this.specialInstructions,
  });

  factory BookingHistoryModel.fromMap(String id, Map<String, dynamic> data) {
    return BookingHistoryModel(
      id: id,
      poojaType: data['poojaType'] ?? '',
      priestName: data['priestName'] ?? '',
      date: data['date'] ?? '',
      time: data['time'] ?? '',
      amount: data['amount'] ?? '',
      specialInstructions: data['specialInstructions'],
    );
  }
}
