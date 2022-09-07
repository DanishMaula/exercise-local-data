import 'package:exercise_data_lokal/ui/berkas_page.dart';
import 'package:exercise_data_lokal/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BerkasPage(),
    );
  }
}
