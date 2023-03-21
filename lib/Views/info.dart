import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF1e85c6),
        appBar: AppBar(
          title: const Text('عن التطبيق'),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 60, left: 50, right: 50),
          children: [
            Text(
              'تطبيق "دروس الكويت" هو تطبيق ديني متعدد الوظائف يهدف إلى تقديم مصادر وموارد شاملة للمسلمين. يحتوي التطبيق على مجموعة كبيرة من الدروس الدينية والخطب والمواد التعليمية المصورة والمسموعة التي يمكن للمستخدمين الاستفادة منها في تعزيز فهمهم ومعرفتهم يحتوي التطبيق على عدد من الأقسام التي تغطي مختلف جوانب الدين الإسلامي، بما في ذلك القرآن الكريم و الدروس و مواقيت الصلاة , القبلة. \nيمكن للمستخدمين البحث في هذه الأقسام والعثور على المواد التي يحتاجونها بسهولة',
              textAlign: TextAlign.justify,
              style: GoogleFonts.cairo(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'تواصل معنا:',
              style: GoogleFonts.cairo(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //youtube
                IconButton(
                  onPressed: () async {
                    oppenUrl(link: ConstantManager.youtube);
                  },
                  icon: Image.asset('assets/images/youtube.png'),
                ),

                //Telegram
                IconButton(
                  onPressed: () async {
                    oppenUrl(link: ConstantManager.telegram);
                  },
                  icon: Image.asset('assets/images/telegram.png'),
                ),

                //instagram
                IconButton(
                  onPressed: () async {
                    oppenUrl(link: ConstantManager.instagram);
                  },
                  icon: Image.asset('assets/images/instagram.png'),
                ),

                //twitter
                IconButton(
                  onPressed: () async {
                    oppenUrl(link: ConstantManager.twitter);
                  },
                  icon: Image.asset('assets/images/twitter.png'),
                ),

                //facebook
                IconButton(
                  onPressed: () async {
                    oppenUrl(link: ConstantManager.facebook);
                  },
                  icon: Image.asset('assets/images/facebook.png'),
                ),

                //snapshat
                IconButton(
                  onPressed: () async {
                    oppenUrl(link: ConstantManager.snapchat);
                  },
                  icon: Image.asset(
                    'assets/images/snapshat.png',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> oppenUrl({required String link}) async {
  Uri url = Uri.parse(link);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
