import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';

class PrayerTime extends StatefulWidget {
  const PrayerTime({super.key});

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  HomeViewModel hvm = HomeViewModel();
  List<String> names = [
    'الفجر',
    'الشروق',
    'الظهر',
    'العصر',
    'المغرب',
    'العشاء',
  ];

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

    if (hvm.adhanData == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      List<String> times = [
        hvm.adhanData!.fajr!,
        hvm.adhanData!.sunrise!,
        hvm.adhanData!.dhuhr!,
        hvm.adhanData!.asr!,
        hvm.adhanData!.maghrib!,
        hvm.adhanData!.isha!,
      ];
      return Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
          ),

          //image
          Positioned(
            top: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    ConstantManager.header,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          // transparant

          Positioned(
            top: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
              ),
            ),
          ),

          // time

          Positioned(
            top: MediaQuery.of(context).size.height * 0.24,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        hvm.adhanData!.dayName!,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Color(0xff350d6f),
                        ),
                      ),
                      Text(
                        hvm.adhanData!.dayNumber!,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Color(0xff350d6f),
                        ),
                      ),
                      Text(
                        hvm.adhanData!.monthName!,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Color(0xff350d6f),
                        ),
                      ),
                      Text(
                        hvm.adhanData!.year!,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Color(0xff350d6f),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      '${hvm.adhanData!.dayNumber} - ${hvm.adhanData!.monthNumber} - ${hvm.adhanData!.year} ',
                      style: const TextStyle(
                        fontSize: 25,
                        color: Color(0xff350d6f),
                      ),
                    ),
                  ),
                  ListView.builder(
                      padding: const EdgeInsets.only(top: 15, bottom: 100),
                      itemCount: times.length,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(
                            names[index],
                            style: const TextStyle(fontSize: 24),
                          ),
                          title: Center(
                            child: Text(
                              times[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }
}
