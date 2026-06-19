class StudentModel {
  final String id;
  final String name;
  final int age;
  bool isPresent;

  StudentModel({
    required this.id,
    required this.name,
    required this.age,
    this.isPresent = false,
  });
}
