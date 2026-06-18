import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const LiteIsCoolApp());
}

class LiteIsCoolApp extends StatelessWidget {
  const LiteIsCoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lite is Cool',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7B5EA7),
          brightness: Brightness.dark,
        ),
      ),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}