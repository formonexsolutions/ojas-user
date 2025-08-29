class BookingModel {
  // Priest Info
  final String priestName;
  final String image;
  final double distance;
  final List<String> poojaTypes;
  final String experience;
  final List<String> languages;
  final String description;
  final double rating;
  final String name; // customer name

  // Booking Info
  final String service;
  final DateTime? dateTime;

  BookingModel({
    required this.priestName,
    required this.image,
    required this.distance,
    required this.poojaTypes,
    required this.experience,
    required this.languages,
    required this.description,
    required this.service,
    required this.name,
    required this.rating,
    this.dateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      "priestName": priestName,
      "image": image,
      "rating": rating,
      "distance": distance,
      "poojaTypes": poojaTypes,
      "experience": experience,
      "languages": languages,
      "description": description,
      "service": service,
      "name": name,
      "dateTime": dateTime?.toIso8601String(),
    };
  }

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      priestName: json["priestName"] ?? "",
      image: json["image"] ?? "",
      rating: (json["rating"] ?? 0).toDouble(),
      distance: (json["distance"] ?? 0).toDouble(),
      poojaTypes: List<String>.from(json["poojaTypes"] ?? []),
      experience: json["experience"] ?? "",
      languages: List<String>.from(json["languages"] ?? []),
      description: json["description"] ?? "",
      service: json["service"] ?? "",
      name: json["name"] ?? "",
      dateTime: json["dateTime"] != null
          ? DateTime.parse(json["dateTime"])
          : null,
    );
  }
}
