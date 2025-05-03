class Person {
  final String name;
  final String lastName;
  final String image;
  final int age;

  Person({
    required this.name,
    required this.lastName,
    required this.image,
    required this.age,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name']['first'],
      lastName: json['name']['last'],
      image: json['picture']['large'],
      age: json['dob']['age'],
    );
  }
}
