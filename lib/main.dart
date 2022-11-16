import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/screens/home_activity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Plant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeActivity(),
    );
  }
}

