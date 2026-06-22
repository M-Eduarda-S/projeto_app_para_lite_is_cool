import 'package:flutter/material.dart';
import '../views/home_screen.dart';
import '../views/attendance_screen.dart';
import '../views/calendar_screen.dart';
import '../views/notification_screen.dart';
import '../views/settings_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String attendance = '/attendance';
  static const String calendar = '/calendar';
  static const String notifications = '/notifications';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> get routes => {
    home: (_) => const HomeScreen(),
    attendance: (_) => const AttendanceScreen(),
    calendar: (_) => const CalendarScreen(),
    notifications: (_) => const NotificationScreen(),
    settings: (_) => const SettingsScreen(),
  };
}