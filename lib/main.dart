import 'package:flutter/material.dart';

import 'style/app_theme.dart';
import 'screens/menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Knucklebones',
      theme: AppTheme.darkTheme,
      home: const MenuScreen(),
    );
  }
}
