import 'package:drosq8/Views/show/article_show.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleMatter extends StatelessWidget {
  final List<dynamic> hvm;

  const ArticleMatter({
    super.key,
    required this.hvm,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        itemCount: hvm.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArticleShow(
                          title: hvm[index].name,
                          id: hvm[index].id,
                        )),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 25, left: 25, top: 16),
              padding: const EdgeInsets.only(left: 10),
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F0FD),
                borderRadius: BorderRadius.circular(08),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      color: Color(0xFFDFDCFF),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(08),
                          bottomRight: Radius.circular(08)),
                    ),
                    child: SvgPicture.asset(
                      ConstantManager.atricle,
                    ),
                  ),
                  const SizedBox(width: 05),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.52,
                    child: Text(
                      hvm[index].name,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.cairo(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Icon(Icons.arrow_back_ios_new),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
