import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controllers/notification_controller.dart';
import '../models/notification_model.dart';
import '../routes/app_routes.dart';
import '../components//custom_header.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final controller = NotificationController();

  static const Color bgColor = Color(0xFF1A1A2E);
  static const Color cardDark = Color(0xFF252542);
  static const Color accentPurple = Color(0xFF7B5EA7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: _BottomNav(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeader(
                    title: 'Notificações',
                    userName: controller.user.name,
                    userRole: controller.user.role,
                  ),
                  const SizedBox(height: 12),
                  _DateChip(date: controller.formattedToday),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          controller.clearAll();
                        });
                      },
                      child: const Text(
                        'Limpar notificações',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: controller.notifications.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Nenhuma notificação',
                            style: TextStyle(color: Colors.white54),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                controller.restoreDefaults();
                              });
                            },
                            icon: const Icon(Icons.refresh, color: Colors.white),
                            label: const Text('Restaurar', style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: accentPurple,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: controller.notifications.length,
                      itemBuilder: (context, index) {
                        final notification = controller.notifications[index];
                        return _NotificationCard(notification: notification);
                      },
                    ),
            ),
          ],
        ),
      ),
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
            style: const TextStyle(
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

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.notification});
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    switch (notification.iconType) {
      case 'report':
        iconData = Icons.assignment_outlined;
        break;
      case 'attendance':
        iconData = Icons.group_outlined;
        break;
      case 'calendar':
        iconData = Icons.calendar_today_outlined;
        break;
      case 'photos':
        iconData = Icons.camera_alt_outlined;
        break;
      default:
        iconData = Icons.notifications_none;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF252542),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(iconData, color: Colors.white54, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notification.content,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ],
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
            icon: const Icon(Icons.calendar_today_outlined,
                color: Colors.white54, size: 28),
            onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.calendar),
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white, size: 28),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
