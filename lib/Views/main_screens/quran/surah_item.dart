import 'package:drosq8/Views/main_screens/quran/quran_view.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:drosq8/data/sura.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SurahItem extends StatelessWidget {
  final String name, verse;
  final int fileNumber;
  const SurahItem({
    super.key,
    required this.fileNumber,
    required this.name,
    required this.verse,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuranView(
                fileNumber: fileNumber,
                surahName: surah[fileNumber - 1],
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, right: 34),
        child: Row(
          children: [
            Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ConstantManager.ayahNum),
                ),
              ),
              child: Center(
                child: Text(fileNumber.toString(),
                    style: GoogleFonts.cairo(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
            ),
            const SizedBox(width: 19),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surah[fileNumber - 1],
                  style: GoogleFonts.cairo(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  'عدد الآيات $verse - $name',
                  style: GoogleFonts.cairo(
                    textStyle: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
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

//' --- ',
