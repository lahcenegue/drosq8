import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:drosq8/Views/categories_list.dart';
import 'package:drosq8/Views/info.dart';
import 'package:drosq8/Views/main_screens/quran/quran_list.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  HomeViewModel hvm = HomeViewModel();

  @override
  void initState() {
    super.initState();
    hvm.fetchAdhan();
  }

  @override
  Widget build(BuildContext context) {
    hvm.addListener(() {
      setState(() {});
    });

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ListView(
          children: [
            //header
            Container(
              height: 245,
              margin: const EdgeInsets.only(
                top: 20,
                left: 24,
                right: 24,
              ),
              padding: const EdgeInsets.only(
                top: 31.1,
                right: 19.1,
                left: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(08),
                image: DecorationImage(
                  image: AssetImage(
                    ConstantManager.header,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            ConstantManager.logo,
                            height: 50,
                          ),
                          Text(
                            ConstantManager.name,
                            style: GoogleFonts.cairo(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const InfoScreen()));
                          },
                          icon: const Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 30,
                          ))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7),

            //prayer time
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مواقيت الصلاة',
                    style: GoogleFonts.cairo(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    child: hvm.adhanData == null
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today_outlined,
                                    color: Color(0xffEAB059),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '${hvm.adhanData!.dayName!}  ${hvm.adhanData!.dayNumber!}  ${hvm.adhanData!.monthName!}  ${hvm.adhanData!.year!}',
                                    style: GoogleFonts.cairo(
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 14),
                              Row(
                                children: [
                                  //fajer
                                  Container(
                                    width: 68,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          'الفجر',
                                          style: GoogleFonts.cairo(
                                            textStyle: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          ConstantManager.fajer,
                                          height: 22,
                                        ),
                                        Text(
                                          hvm.adhanData!.fajr!,
                                          style: GoogleFonts.cairo(
                                            textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  //doher
                                  Container(
                                      width: 68,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            'الظهر',
                                            style: GoogleFonts.cairo(
                                              textStyle: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Image.asset(
                                            ConstantManager.doher,
                                            height: 22,
                                          ),
                                          Text(
                                            hvm.adhanData!.dhuhr!,
                                            style: GoogleFonts.cairo(
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),

                                  //aser
                                  Container(
                                      width: 68,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            'العصر',
                                            style: GoogleFonts.cairo(
                                              textStyle: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Image.asset(
                                            ConstantManager.aser,
                                            height: 22,
                                          ),
                                          Text(
                                            hvm.adhanData!.asr!,
                                            style: GoogleFonts.cairo(
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),

                                  //maghreb
                                  Container(
                                      width: 68,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            'المغرب',
                                            style: GoogleFonts.cairo(
                                              textStyle: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Image.asset(
                                            ConstantManager.maghreb,
                                            height: 22,
                                          ),
                                          Text(
                                            hvm.adhanData!.maghrib!,
                                            style: GoogleFonts.cairo(
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),

                                  //isha
                                  Container(
                                      width: 68,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            'العشاء',
                                            style: GoogleFonts.cairo(
                                              textStyle: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Image.asset(
                                            ConstantManager.isha,
                                            height: 22,
                                          ),
                                          Text(
                                            hvm.adhanData!.isha!,
                                            style: GoogleFonts.cairo(
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            //
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //doross
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoriesList(),
                          ),
                        );
                      },
                      child: Container(
                        height: 220,
                        width: 180,
                        padding: const EdgeInsets.only(top: 46),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              ConstantManager.dorossBack,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              ConstantManager.dorossIcon,
                              height: 58,
                            ),
                            const SizedBox(height: 9),
                            Text(
                              'دروس الكويت',
                              style: GoogleFonts.cairo(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // quran
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuranList(),
                          ),
                        );
                      },
                      child: Container(
                        height: 220,
                        width: 180,
                        padding: const EdgeInsets.only(top: 46),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              ConstantManager.quranBack,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              ConstantManager.quranIcon,
                              height: 58,
                            ),
                            const SizedBox(height: 9),
                            Text(
                              'القرآن الكريم',
                              style: GoogleFonts.cairo(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // quibla
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 220,
                    width: 180,
                    padding: const EdgeInsets.only(top: 46),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          ConstantManager.quiblaBack,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          ConstantManager.quiblaIcon,
                          height: 58,
                        ),
                        const SizedBox(height: 9),
                        Text(
                          'القبلة',
                          style: GoogleFonts.cairo(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
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
