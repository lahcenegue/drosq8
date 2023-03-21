import 'package:drosq8/Views/main_screens/quran/surah_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class QuranList extends StatefulWidget {
  const QuranList({super.key});

  @override
  State<QuranList> createState() => _QuranListState();
}

class _QuranListState extends State<QuranList> {
  var surahsNames = [];
  var surahsVerses = [];
  @override
  void initState() {
    getSurahContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('القرآن الكريم'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 23, right: 23, top: 17, bottom: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الفهرس',
                      style: GoogleFonts.cairo(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    )
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: surahsNames.length,
                itemBuilder: (context, index) => SurahItem(
                  fileNumber: index + 1,
                  name: surahsNames.elementAt(index),
                  verse: surahsVerses.elementAt(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getSurahContent() async {
    FileOperations fo = FileOperations();
    String data = await fo.getDataFromFile('assets/content/sura_names.txt');
    surahsNames = data.split("\n");
    data = await fo.getDataFromFile('assets/content/suras_nums.txt');
    surahsVerses = data.split("\n");

    setState(() {});
  }
}

class FileOperations {
  Future<String> getDataFromFile(String path) async {
    return await rootBundle.loadString(path);
  }
}
