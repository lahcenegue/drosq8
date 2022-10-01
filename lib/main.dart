import 'package:drosq8/Views/home_screen.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: ConstantManager.mainColor,
          titleTextStyle: GoogleFonts.amiri(
              textStyle: TextStyle(
            color: ConstantManager.textColor,
            fontSize: 28,
          )),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
