import 'package:drosq8/Views/main_screens/quran/quran_list.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuranView extends StatefulWidget {
  final int fileNumber;

  const QuranView({
    super.key,
    required this.fileNumber,
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "assets/sName/sname_${widget.fileNumber}.png",
          height: 40,
          color: Colors.white,
        ),
      ),
      body: ayah.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 35,
                    child: Image.asset(
                      "assets/images/img_bismillah.png",
                      color: ConstantManager.quranColor,
                    ),
                  ),
                  const SizedBox(height: 00),
                  ListView.builder(
                      padding: const EdgeInsets.all(20.0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            surahText,
                            textScaleFactor: 1.3,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: "quranFont",
                              fontSize: 24,
                              color: ConstantManager.quranColor,
                            ),
                          ),
                        );
                      }),
                ],
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
      surahText += "(${ayahNum.toString()}) ";
      ayahNum++;
    }

    setState(() {});
  }

  Future<String> getDataFromFile(String path) async {
    return await rootBundle.loadString(path);
  }
}
