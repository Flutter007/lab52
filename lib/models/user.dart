class User {
  final String name;
  final String lastName;
  final String image;
  final int age;
  final String gender;
  final String location;

  User({
    required this.name,
    required this.lastName,
    required this.image,
    required this.age,
    required this.gender,
    required this.location,
  });

  User copyWith({
    String? gender,
    String? name,
    String? lastName,
    String? image,
    int? age,
    String? location,
  }) {
    return User(
      gender: gender ?? this.gender,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      image: image ?? this.image,
      age: age ?? this.age,
      location: location ?? this.location,
    );
  }
}
