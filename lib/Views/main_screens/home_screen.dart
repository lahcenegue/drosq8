import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:drosq8/Views/categories_list.dart';
import 'package:drosq8/Views/main_screens/home_page.dart';
import 'package:drosq8/Views/main_screens/adan/prayer_time.dart';
import 'package:drosq8/Views/main_screens/qibla/qibla_screen.dart';
import 'package:drosq8/Views/main_screens/quran/quran_list.dart';
import 'package:drosq8/constants/constant.dart';
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
    PrayerTime(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text(ConstantManager.name),
          actions: const [
            Icon(
              Icons.info_outline,
              size: 36,
            ),
            SizedBox(width: 20),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: index,
          height: 60,
          backgroundColor: Colors.transparent,
          color: ConstantManager.mainColor,
          items: const <Widget>[
            Icon(Icons.menu, size: 30),
            Icon(Icons.my_library_books, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.wifi, size: 30),
            Icon(Icons.av_timer_rounded, size: 30),
          ],
          onTap: (index) => setState(() => this.index = index),
        ),
        body: screens[index],
      ),
    );
  }
}
