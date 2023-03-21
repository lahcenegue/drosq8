import 'package:drosq8/Views/categories_list.dart';

import 'package:drosq8/Views/main_screens/home_page.dart';
import 'package:drosq8/Views/main_screens/qibla/qibla_screen.dart';
import 'package:drosq8/Views/main_screens/quran/quran_list.dart';

import 'package:drosq8/data/categories_api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CategoriesApi categoriesApi = CategoriesApi();

  int index = 2;

  final screens = const [
    CategoriesList(),
    QuranList(),
    MainScreen(),
    QiblaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: screens[index],
      ),
    );
  }
}
