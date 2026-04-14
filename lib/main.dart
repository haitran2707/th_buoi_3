import 'package:flutter/material.dart';
import 'screens/settings_screen.dart';   // ← Import màn hình cấu hình

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Đố Vui',
      debugShowCheckedModeBanner: false,           // Tắt banner "Debug"

      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,     // Nền trắng giống ảnh
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),

      home: const GameSettingsScreen(),   // ← Đặt làm màn hình chính
    );
  }
}