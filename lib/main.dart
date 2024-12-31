import 'package:flutter/material.dart';
import 'package:rickandmortyapp/app/locator.dart';
import 'package:rickandmortyapp/app/router.dart';
import 'package:rickandmortyapp/app/theme.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
