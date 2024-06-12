import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:recipbook/presentation/pages/add_recipe_page/add_recipe_page.dart';
import 'package:recipbook/presentation/pages/home_page/home_page.dart';
import 'package:recipbook/presentation/pages/notification_page/notification_page.dart';
import 'package:recipbook/presentation/pages/profile_page/profile_page.dart';
import 'package:recipbook/presentation/pages/saved_page/saved_page.dart';

import '../widgets/bottom_navbar.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List screens = [
    HomePage(),
    SavedPage(),
    AddRecipePage(),
    NotificationPage(),
    ProfilePage(),
  ];

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(IconlyBold.plus),
      // ),
      body: screens[currentIndex],
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomNavbar(
        currentIndex: currentIndex,
        ontap: changeIndex,
      ),
    );
  }
}
