import 'package:drosq8/Views/main_screens/quran/quran_list.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuranView extends StatefulWidget {
  final int fileNumber;
  final String surahName;

  const QuranView({
    super.key,
    required this.fileNumber,
    required this.surahName,
  });

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  var ayah = [];
  String surahText = '';

  @override
  void initState() {
    getAyah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.surahName),
        ),
        body: ayah.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 40,
                      child: Image.asset(
                        "assets/images/img_bismillah.png",
                        color: ConstantManager.ayahColor,
                      ),
                    ),
                    const SizedBox(height: 00),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          surahText,
                          textScaleFactor: 1.3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: "quranFont",
                            fontSize: 22,
                            color: ConstantManager.ayahColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  getAyah() async {
    FileOperations fo = FileOperations();
    int ayahNum = 1;
    String data =
        await fo.getDataFromFile('assets/txts/${widget.fileNumber}.txt');
    ayah = data.split("\n");
    for (var line in ayah) {
      surahText += line;
      surahText += "(${ayahNum.toString()})";
      ayahNum++;
    }

    setState(() {});
  }

  Future<String> getDataFromFile(String path) async {
    return await rootBundle.loadString(path);
  }
}
