import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/calendar_controller.dart';
import '../models/event_model.dart';
import '../routes/app_routes.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  static const Color bgColor = Color(0xFF1A1A2E);
  static const Color cardDark = Color(0xFF252542);

  @override
  Widget build(BuildContext context) {
    final controller = CalendarController();

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
              const SizedBox(height: 12),
              _DateChip(date: controller.formattedToday),
              const SizedBox(height: 24),
              _CalendarCard(),
              const SizedBox(height: 24),
              ...controller.events.map((event) {
                if (event.isBirthday) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _BirthdayBanner(event: event),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _EventTile(event: event),
                  );
                }
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.controller});
  final CalendarController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Calendário',
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  controller.user.name,
                  style: GoogleFonts.arimo(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  controller.user.role,
                  style: GoogleFonts.arimo(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              radius: 24,
              backgroundColor: const Color(0xFF3D3D6B),
              child: ClipOval(
                child: SvgPicture.asset(
                  'assets/icons/user_icon.svg',
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DateChip extends StatelessWidget {
  const _DateChip({required this.date});
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF7B5EA7), Color(0xFF1DB954)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.calendar_month, color: Colors.white, size: 18),
          const SizedBox(width: 8),
          Text(
            date,
            style: GoogleFonts.arimo(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _CalendarCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      decoration: BoxDecoration(
        color: const Color(0xFF252542),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Center(
        child: Icon(
          Icons.calendar_month,
          color: Colors.white10,
          size: 100,
        ),
      ),
    );
  }
}

class _BirthdayBanner extends StatelessWidget {
  const _BirthdayBanner({required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF7B5EA7), Color(0xFF1DB954)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 12,
            bottom: 0,
            child: SvgPicture.asset(
              'assets/icons/aniversario.svg',
              height: 75,
              colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
              placeholderBuilder: (context) => const Icon(Icons.cake, color: Colors.white24, size: 60),
            ),
          ),
          Positioned(
            left: 100,
            right: 16,
            top: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  children: [
                    const TextSpan(text: 'Hoje é '),
                    TextSpan(
                      text: 'aniversário',
                      style: GoogleFonts.quicksand(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: ' do Fulano 1!'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EventTile extends StatelessWidget {
  const _EventTile({required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF252542),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: event.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            event.title,
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF13132A),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.dashboard, color: Colors.white54, size: 28),
            onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.home),
          ),
          IconButton(
            icon: const Icon(Icons.group_outlined, color: Colors.white54, size: 28),
            onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.attendance),
          ),
          IconButton(
            icon: const Icon(Icons.calendar_month, color: Colors.white, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.notifications_none_outlined, color: Colors.white54, size: 28),
                Positioned(
                  right: 2,
                  top: 2,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF37B55),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.notifications),
          ),
        ],
      ),
    );
  }
}
