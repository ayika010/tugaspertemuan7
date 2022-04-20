import 'package:flutter/material.dart';
import 'screens/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/boxes.dart';
import 'models/keranjang.dart';

void main() async {
  Hive.initFlutter();
  Hive.registerAdapter(KeranjangAdapter());
  await Hive.openBox<Keranjang>(HiveBoxex.keranjang);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Pertemuan 7',
      theme: ThemeData(
        primaryColor: Color(0xFF2661FA),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
