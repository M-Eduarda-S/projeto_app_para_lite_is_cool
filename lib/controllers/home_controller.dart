import '../models/report_model.dart';
import '../models/user_model.dart';

class HomeController {
  final UserModel user = const UserModel(
    name: 'Juliana Simon',
    role: 'Bolsista',
  );

  final ReportModel? lastReport = ReportModel(
    id: '1',
    title: 'Relatório Lite is Cool',
    generalContent:
    'blablablablablablablablablablablablablablablablablablablablablablablablablabla'
        'blablablablablablablablablablablablablablablablablablablablablablablabla',
    date: DateTime(2026, 6, 11),
  );

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

  String get weekdayGreeting {
    final now = DateTime.now();
    const weekdays = [
      'Segunda-feira', 'Terça-feira', 'Quarta-feira',
      'Quinta-feira', 'Sexta-feira', 'Sábado', 'Domingo',
    ];
    return '${weekdays[now.weekday - 1]} chegou!';
  }

  String get lastUpdateLabel {
    if (lastReport == null) return 'Nenhum relatório encontrado.';
    return 'Sua última atualização\ncompleta foi feita no dia ${lastReport!.shortDate}';
  }
}