import 'dart:math';
import '../models/student_model.dart';
import '../models/user_model.dart';

class AttendanceController {
  // Singleton instance
  static final AttendanceController _instance = AttendanceController._internal();
  factory AttendanceController() => _instance;

  final UserModel user = const UserModel(
    name: 'Juliana Simon',
    role: 'Bolsista',
  );

  final List<String> _availableIcons = [
    'assets/icons/icone1.svg',
    'assets/icons/icone2.svg',
    'assets/icons/icone3.svg',
  ];

  late List<StudentModel> students;

  AttendanceController._internal() {
    students = [
      StudentModel(id: '1', name: 'FULANO DE TAL 1', age: 10, isPresent: true, iconPath: _getRandomIcon()),
      StudentModel(id: '2', name: 'FULANO DE TAL 2', age: 11, isPresent: true, iconPath: _getRandomIcon()),
      StudentModel(id: '3', name: 'FULANO DE TAL 3', age: 10, isPresent: false, iconPath: _getRandomIcon()),
      StudentModel(id: '4', name: 'FULANO DE TAL 4', age: 12, isPresent: false, iconPath: _getRandomIcon()),
      StudentModel(id: '5', name: 'FULANO DE TAL 5', age: 10, isPresent: false, iconPath: _getRandomIcon()),
      StudentModel(id: '6', name: 'FULANO DE TAL 6', age: 11, isPresent: false, iconPath: _getRandomIcon()),
      StudentModel(id: '7', name: 'FULANO DE TAL 7', age: 10, isPresent: false, iconPath: _getRandomIcon()),
    ];
  }

  String _getRandomIcon() {
    return _availableIcons[Random().nextInt(_availableIcons.length)];
  }

  String get formattedToday {
    final now = DateTime.now();
    const weekdays = [
      'Segunda-feira', 'Terça-feira', 'Quarta-feira',
      'Quinta-feira', 'Sexta-feira', 'Sábado', 'Domingo',
    ];
    const months = [
      'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
      'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro',
    ];
    final weekday = weekdays[now.weekday - 1];
    final month = months[now.month - 1];
    return '$weekday, ${now.day} de $month';
  }

  void togglePresence(int index) {
    students[index].isPresent = !students[index].isPresent;
  }

  void addStudent(String name, int age) {
    final id = (students.length + 1).toString();
    students.add(StudentModel(
      id: id,
      name: name.toUpperCase(),
      age: age,
      isPresent: false,
      iconPath: _getRandomIcon(),
    ));
  }

  void deleteStudent(String id) {
    students.removeWhere((student) => student.id == id);
  }
}
