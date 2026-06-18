import 'package:flutter/material.dart';

class _PlaceholderScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;

  const _PlaceholderScreen({
    required this.title,
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF13132A),
        foregroundColor: Colors.white,
        title: Text(title),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 72, color: const Color(0xFF7B5EA7)),
              const SizedBox(height: 24),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white54, fontSize: 14),
              ),
              const SizedBox(height: 32),
              OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFF7B5EA7)),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CreateReportScreen extends StatelessWidget {
  const CreateReportScreen({super.key});

  @override
  Widget build(BuildContext context) => const _PlaceholderScreen(
    title: 'Novo Relatório',
    icon: Icons.assignment_add,
    description: 'Aqui será exibido o formulário para criação de um novo relatório de encontro.',
  );
}

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) => const _PlaceholderScreen(
    title: 'Presenças',
    icon: Icons.people_alt_outlined,
    description: 'Aqui será exibida a lista de presença dos participantes do projeto.',
  );
}

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) => const _PlaceholderScreen(
    title: 'Calendário',
    icon: Icons.calendar_month_outlined,
    description: 'Aqui será exibido o calendário com os encontros agendados do projeto.',
  );
}

class ReportDetailScreen extends StatelessWidget {
  const ReportDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    return const _PlaceholderScreen(
      title: 'Detalhes do Relatório',
      icon: Icons.description_outlined,
      description: 'Aqui será exibido o relatório completo para visualização e edição.',
    );
  }
}
