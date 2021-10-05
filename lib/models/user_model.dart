class UserModel {
  final String id, name, description, location, picture;
  final DateTime birthday;

  int? _age;

  UserModel({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.picture,
    required this.birthday,
  });

  int get age => _age ??= DateTime.now().year - birthday.year;
}
