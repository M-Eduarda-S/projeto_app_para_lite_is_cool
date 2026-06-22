class AppDateUtils {
  static String get formattedToday {
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
}