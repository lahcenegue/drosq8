import 'package:drosq8/widgets/surah_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          //To Do
        },
        child: SizedBox(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 15.0),
            shrinkWrap: true,
            itemCount: surahsNames.length,
            itemBuilder: (context, index) => SurahItem(
              fileNumber: index + 1,
              name: surahsNames.elementAt(index),
              verse: surahsVerses.elementAt(index),
            ),
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
