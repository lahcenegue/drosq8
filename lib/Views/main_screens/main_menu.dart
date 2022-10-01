import 'package:drosq8/Views/categories_list.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        body: ListView(
          children: const [
            CategoriesList(),
          ],
        ),
      )),
    );
  }
}
