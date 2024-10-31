import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/Akun/LoginScreen.dart';

import 'Akun/RegisterScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Invest Yuk',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()), // Rute LoginScreen
        GetPage(name: '/register', page: () => RegisterScreen()), // Rute RegisterScreen
      ],
    );
  }
}


// Kelas UMKM untuk menyimpan informasi UMKM
class UMKM {
  String name;
  String location;
  String performance;

  UMKM({
    required this.name,
    required this.location,
    required this.performance,
  });
}
