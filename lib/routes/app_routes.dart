import 'package:flutter/material.dart';
import '../views/home_screen.dart';
import '../views/create_report_screen.dart';
import '../views/attendance_screen.dart';
import '../views/calendar_screen.dart';
import '../views/notification_screen.dart';
import '../views/report_detail_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String createReport = '/create-report';
  static const String attendance = '/attendance';
  static const String calendar = '/calendar';
  static const String reportDetail = '/report-detail';
  static const String notifications = '/notifications';

  static Map<String, WidgetBuilder> get routes => {
    home: (_) => const HomeScreen(),
    createReport: (_) => const CreateReportScreen(),
    attendance: (_) => const AttendanceScreen(),
    calendar: (_) => const CalendarScreen(),
    reportDetail: (_) => const ReportDetailScreen(),
    notifications: (_) => const NotificationScreen(),
  };
}
