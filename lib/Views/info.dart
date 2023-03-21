import 'package:drosq8/constants/constant.dart';
import 'package:drosq8/widgets/image_link.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ConstantManager.name),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //snapshat
              imageLink(
                onPressed: () {},
                link: 'assets/images/snpshat.png',
              ),

              //youtube
              imageLink(
                onPressed: () {},
                link: 'assets/images/yt.png',
              ),

              //Telegram
              imageLink(
                onPressed: () {},
                link: 'assets/images/telegram.png',
              ),

              //instagram
              imageLink(
                onPressed: () {},
                link: 'assets/images/insta.png',
              ),

              //twitter
              imageLink(
                onPressed: () {},
                link: 'assets/images/tw.png',
              ),

              //facebook
              imageLink(
                onPressed: () {},
                link: 'assets/images/fb.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
