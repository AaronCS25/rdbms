import 'package:dbms/config/routes/app_router.dart';
import 'package:dbms/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: "DBMS",
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
