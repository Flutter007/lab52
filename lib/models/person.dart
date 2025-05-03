class Person {
  final String name;
  final String lastName;
  final String image;
  final int age;
  final String city;
  final String country;

  Person({
    required this.name,
    required this.lastName,
    required this.image,
    required this.age,
    required this.city,
    required this.country,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name']['first'],
      lastName: json['name']['last'],
      image: json['picture']['large'],
      age: json['dob']['age'],
      city: json['location']['city'],
      country: json['location']['country'],
    );
  }
}
