import 'package:flutter/material.dart';
import 'config/router/router.dart';
import 'config/theme/theme.dart';

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Creative Compass: Pro',
      theme: AppTheme.theme,
      routerConfig: _router.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
