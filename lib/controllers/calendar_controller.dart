import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/event_model.dart';
import '../utils/date_utils.dart';

class CalendarController {
  final UserModel user = const UserModel(
    name: 'Juliana Simon',
    role: 'Bolsista',
  );

  String get formattedToday => AppDateUtils.formattedToday;

  List<EventModel> get events => [
    EventModel(
      title: 'Hoje é aniversário do Fulano 1!',
      date: DateTime(2026, 6, 16),
      color: const Color(0xFF7B5EA7),
      isBirthday: true,
    ),
    EventModel(
      title: 'Apresentação de fim de mês',
      date: DateTime(2026, 6, 16),
      color: const Color(0xFF4A90E2),
    ),
    EventModel(
      title: 'Último dia do semestre',
      date: DateTime(2026, 6, 16),
      color: const Color(0xFFF5A623),
    ),
  ];
}
