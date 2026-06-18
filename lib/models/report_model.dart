class ReportModel {
  final String id;
  final String title;
  final String generalContent;
  final DateTime date;

  ReportModel({
    required this.id,
    required this.title,
    required this.generalContent,
    required this.date,
  });

  String get formattedDate {
    const months = [
      'jan.', 'fev.', 'mar.', 'abr.', 'mai.', 'jun.',
      'jul.', 'ago.', 'set.', 'out.', 'nov.', 'dez.'
    ];
    return '${date.day} de ${months[date.month - 1]} de ${date.year}';
  }

  String get shortDate {
    final d = date.day.toString().padLeft(2, '0');
    final m = date.month.toString().padLeft(2, '0');
    return '$d/$m';
  }
}
