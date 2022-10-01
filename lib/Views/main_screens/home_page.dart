import 'package:drosq8/Views/main_screens/books_show.dart';
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

            const BooksShow(
              catId: '260',
            ),
            const SizedBox(height: 50),

            // const BookList(),
            // const Separation(title: 'صوتيات'),
            // const AudioList(
            //   icon: Icon(Icons.volume_up),
            // ),
            // const Separation(title: 'بث مباشر'),
            // const AudioList(
            //   icon: Icon(Icons.live_tv_rounded),
            // ),
          ],
        ),
      )),
    );
  }
}
