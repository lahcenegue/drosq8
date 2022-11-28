import 'package:drosq8/widgets/books_show.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:drosq8/widgets/separation.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        body: ListView(
          children: [
            Image.asset(
              ConstantManager.header,
              width: screenWidth,
            ),
            Separation(
              title: 'الكتب الإلكترونية',
              onTap: () {},
            ),
            const BooksShow(),
            const SizedBox(height: 10),
            Separation(
              title: 'الصوتيات',
              onTap: () {},
            ),
            const SizedBox(height: 10),
            // const AudioShow(),
          ],
        ),
      )),
    );
  }
}
