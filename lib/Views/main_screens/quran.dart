import 'package:drosq8/widgets/surah_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
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
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 15.0),
        shrinkWrap: true,
        itemCount: surahsNames.length,
        itemBuilder: (context, index) => SurahItem(
          fileNumber: index + 1,
          name: surahsNames.elementAt(index),
          verse: surahsVerses.elementAt(index),
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
