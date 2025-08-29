class PanditModel1 {
  final String id;
  final String name;
  final String email;
  final String imageUrl;
  final double rating;
  final String address;
  final double distance;
  final List<String> poojaTypes;

  final String experience;
  final List<String> language;
  final List<String> about;

  PanditModel1({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.rating,
    required this.address,
    required this.distance,
    required this.poojaTypes,
    required this.experience,
    required this.language,
    required this.about,
  });

  /// Helper to handle both List and comma-separated String
  static List<String> _parseList(dynamic data) {
    if (data == null) return [];
    if (data is List) {
      return data.map((e) => e.toString()).toList();
    } else if (data is String) {
      return data.split(',').map((e) => e.trim()).toList();
    }
    return [];
  }

  factory PanditModel1.fromJson(Map<String, dynamic> json, String id) {
    return PanditModel1(
      id: id,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      address: json['address'] ?? '',
      distance: (json['distance'] ?? 0).toDouble(),
      poojaTypes: [
        "Satyanarayan Pooja",
        "Grih Pravesh",
        "Mundan",
        "Ganesh Pooja",
        "Online Pooja",
        "Other Pooja"
      ], // 🔥 hardcoded

      experience: json['experience'] ?? '',
      language: _parseList(json['language']),
      about: [
        ""
      ],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      "email":email,
      'imageUrl': imageUrl,
      'rating': rating,
      'address': address,
      'distance': distance,
      'poojaTypes': poojaTypes,
      'experience': experience,
      'language': language,
      'about': about,
    };
  }
}
