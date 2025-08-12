import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Routes/AppRoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ojas App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.deepPurple,
          elevation: 0,
        ),
      ),
      // The initial route is set to the splash screen.
      initialRoute: AppRoutes.splash,
      // GetX uses the routes defined in AppPages.
      getPages: AppPages.routes,
    );
  }
}