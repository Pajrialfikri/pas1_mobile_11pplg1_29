import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_29/controller/bottom_nav_controller.dart';
import 'package:pas1_mobile_11pplg1_29/home/menu/apiPage.dart';
import 'package:pas1_mobile_11pplg1_29/home/menu/databasePage.dart';
import 'package:pas1_mobile_11pplg1_29/home/menu/profilePage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController = Get.put(BottomNavController());

    final List<Widget> menus = [ApiPage(), DatabasePage(), ProfilPage()];

    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.black,
        body: menus[bottomNavController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: bottomNavController.selectedIndex.value,
          onTap: bottomNavController.changeIndexMenu,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "API"),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      );
    });
  }
}
