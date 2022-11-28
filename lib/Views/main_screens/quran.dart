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
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 15.0),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container();
        },
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
