import 'package:drosq8/Views/main_screens/quran/quran_view.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';

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
              ),
            ));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 10,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ConstantManager.quranColor,
                          ),
                          child: Center(
                            child: Text(
                              fileNumber.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          height: 40,
                          child: Image.asset(
                            "assets/sName/sname_$fileNumber.png",
                            color: ConstantManager.quranColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          verse,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ConstantManager.quranColor,
                          ),
                        ),
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
