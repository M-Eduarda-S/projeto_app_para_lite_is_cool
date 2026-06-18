import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import '../models/report_model.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color bgColor = Color(0xFF1A1A2E);
  static const Color cardDark = Color(0xFF252542);

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();
    final report = controller.lastReport;

    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: _BottomNav(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(controller: controller),
              const SizedBox(height: 24),
              _BannerCard(
                greeting: controller.weekdayGreeting,
                onTap: () => Navigator.pushNamed(context, AppRoutes.createReport),
              ),
              const SizedBox(height: 16),
              _QuickActions(
                onAttendance: () =>
                    Navigator.pushNamed(context, AppRoutes.attendance),
                onCalendar: () =>
                    Navigator.pushNamed(context, AppRoutes.calendar),
              ),
              const SizedBox(height: 16),
              if (report != null)
                _ReportCard(
                  report: report,
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoutes.reportDetail,
                    arguments: report,
                  ),
                ),
              const SizedBox(height: 16),
              _LastUpdateBanner(label: controller.lastUpdateLabel),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Header ───────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  const _Header({required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.formattedToday,
              style: const TextStyle(color: Colors.white54, fontSize: 13),
            ),
            const SizedBox(height: 4),
            Text(
              'Olá, ${controller.user.firstName}!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  controller.user.name,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
                Text(
                  controller.user.role,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(width: 10),
            const CircleAvatar(
              radius: 24,
              backgroundColor: Color(0xFF3D3D6B),
              child: Icon(Icons.person, color: Colors.white54),
            ),
          ],
        ),
      ],
    );
  }
}

// ─── Banner "Dia chegou" ───────────────────────────────────────────────────────

class _BannerCard extends StatelessWidget {
  const _BannerCard({required this.greeting, required this.onTap});
  final String greeting;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF7B5EA7), Color(0xFF1DB954)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    greeting,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text.rich(
                    TextSpan(
                      text: 'Gostaria de iniciar um ',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      children: [
                        TextSpan(
                          text: 'novo relatório',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: '?'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.add_circle_outline,
                  color: Colors.white70, size: 42),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Quick actions (Presenças / Calendário) ───────────────────────────────────

class _QuickActions extends StatelessWidget {
  const _QuickActions({
    required this.onAttendance,
    required this.onCalendar,
  });
  final VoidCallback onAttendance;
  final VoidCallback onCalendar;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionCard(
            label: 'Presenças',
            icon: Icons.people_alt_outlined,
            onTap: onAttendance,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ActionCard(
            label: 'Calendário',
            icon: Icons.calendar_today_outlined,
            onTap: onCalendar,
          ),
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.label,
    required this.icon,
    required this.onTap,
  });
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: const Color(0xFF252542),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(icon, color: Colors.white54, size: 36),
          ],
        ),
      ),
    );
  }
}

// ─── Last Report Card ─────────────────────────────────────────────────────────

class _ReportCard extends StatelessWidget {
  const _ReportCard({required this.report, required this.onTap});

  final ReportModel report;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias, // Mantém o footer dentro das bordas arredondadas
        decoration: BoxDecoration(
          color: Colors.white, // Fundo principal agora é branco
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Document preview
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    report.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Ajustado para dar leitura no fundo branco
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Relatório geral:',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    report.generalContent,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black54,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Footer
            Container(
              color: const Color(0xFF252542), // Cor escura movida para o footer
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Relatório ${report.shortDate}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Clique para editar!',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF1A1A2E),
                    ),
                    child: const Icon(
                      Icons.edit_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ─── Last update banner ───────────────────────────────────────────────────────

class _LastUpdateBanner extends StatelessWidget {
  const _LastUpdateBanner({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF7B5EA7), Color(0xFF2ECC71)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.check_circle_outline,
                color: Colors.white70, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Bottom Navigation ────────────────────────────────────────────────────────

class _BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF13132A),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home (active)
          IconButton(
            icon: const Icon(Icons.dashboard, color: Colors.white, size: 28),
            onPressed: () {},
          ),
          // New report
          IconButton(
            icon: const Icon(Icons.assignment_outlined,
                color: Colors.white54, size: 28),
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.createReport),
          ),
          // Attendance
          IconButton(
            icon: const Icon(Icons.group_outlined,
                color: Colors.white54, size: 28),
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.attendance),
          ),
        ],
      ),
    );
  }
}
