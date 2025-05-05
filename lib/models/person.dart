class Person {
  final String name;
  final String lastName;
  final String image;
  final int age;
  final String city;
  final String country;
  final String uuid;
  bool isLiked = false;

  Person({
    required this.name,
    required this.lastName,
    required this.image,
    required this.age,
    required this.city,
    required this.country,
    required this.uuid,
    this.isLiked = false,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name']['first'],
      lastName: json['name']['last'],
      image: json['picture']['large'],
      age: json['dob']['age'],
      city: json['location']['city'],
      country: json['location']['country'],
      uuid: json['login']['uuid'],
    );
  }
  Person copyWith({
    String? name,
    String? lastName,
    String? image,
    int? age,
    String? city,
    String? country,
    bool? isLiked,
    String? uuid,
  }) {
    return Person(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      image: image ?? this.image,
      age: age ?? this.age,
      city: city ?? this.city,
      country: country ?? this.country,
      isLiked: isLiked ?? this.isLiked,
      uuid: uuid ?? this.uuid,
    );
  }
}
