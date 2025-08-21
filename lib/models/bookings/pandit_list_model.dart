class PanditModel {
  final String name;
  final String experience;
  final double rating;
  final String location;
  final double distance;
  final List<String> languages;
  final String imageUrl;
  final bool available;

  PanditModel({
    required this.name,
    required this.experience,
    required this.rating,
    required this.location,
    required this.distance,
    required this.languages,
    required this.imageUrl,
    required this.available,
  });
}
