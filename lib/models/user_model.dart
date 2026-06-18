class UserModel {
  final String name;
  final String role;

  const UserModel({required this.name, required this.role});

  String get firstName => name.split(' ').first;
}
