class Festival {
  final String name;
  final String date;       // keep as String for simplicity
  final String image;
  final String description;

  const Festival({
    required this.name,
    required this.date,
    required this.image,
    required this.description,
  });

  factory Festival.fromMap(Map<String, dynamic> map) {
    return Festival(
      name: map['name'] as String,
      date: map['date'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
    'name': name,
    'date': date,
    'image': image,
    'description': description,
  };

  @override
  String toString() => 'Festival(name: $name)';
}
