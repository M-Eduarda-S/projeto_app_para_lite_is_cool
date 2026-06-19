class StudentModel {
  final String id;
  final String name;
  final int age;
  final String iconPath;
  bool isPresent;

  StudentModel({
    required this.id,
    required this.name,
    required this.age,
    required this.iconPath,
    this.isPresent = false,
  });
}
