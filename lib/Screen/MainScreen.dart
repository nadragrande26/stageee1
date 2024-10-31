

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Controller/HomeController.dart';
import 'package:myapp/Screen/ProfileScreen.dart';
import 'package:myapp/Screen/UmkmSearchScreen.dart';
import 'package:myapp/Screen/WelcomeScreen.dart';

class MainScreen extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (homeController.currentIndex.value) {
          case 0:
            return WelcomeScreen();
          case 1:
            return UmkmSearchScreen();
          case 2:
            return ProfileScreen();
          default:
            return WelcomeScreen();
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: homeController.currentIndex.value,
        selectedItemColor: Colors.green,
        onTap: (int index) {
          homeController.changePage(index); // Update indeks halaman
        },
      ),
    );
  }
}