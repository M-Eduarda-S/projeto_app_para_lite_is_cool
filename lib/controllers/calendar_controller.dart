import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/event_model.dart';

class CalendarController {
  final UserModel user = const UserModel(
    name: 'Juliana Simon',
    role: 'Bolsista',
  );

  String get formattedToday {
    // For the image example, let's use 16 de Junho
    final date = DateTime(2026, 6, 16);
    const weekdays = [
      'Segunda-feira', 'Terça-feira', 'Quarta-feira',
      'Quinta-feira', 'Sexta-feira', 'Sábado', 'Domingo',
    ];
    const months = [
      'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
      'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro',
    ];
    final weekday = weekdays[date.weekday - 1];
    final month = months[date.month - 1];
    return '$weekday, ${date.day} de $month';
  }

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
