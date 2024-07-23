import 'package:flutter/material.dart';
import 'package:news/layout/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeNAme,
      routes: {
        HomeScreen.routeNAme: (context) => HomeScreen(),
      },
    );
  }
}
