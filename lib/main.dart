import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipbook/const.dart';
import 'package:recipbook/presentation/pages/home_page/home_page.dart';
import 'package:recipbook/presentation/pages/main_screen.dart';
import 'package:recipbook/presentation/pages/auth_pages/start_page.dart';
import 'package:recipbook/providers/Recipe_provider.dart';
import 'package:recipbook/providers/notification_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => RecipeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => NotificationProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Recip Book",
      // home: StartPage(),
      home: StartPage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
