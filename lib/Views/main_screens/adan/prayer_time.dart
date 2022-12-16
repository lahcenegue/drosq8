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
      return Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: ConstantManager.mainColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        hvm.adhanData!.dayName!,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        hvm.adhanData!.dayNumber!,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        hvm.adhanData!.monthName!,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        hvm.adhanData!.year!,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    '${hvm.adhanData!.dayNumber} - ${hvm.adhanData!.monthNumber} - ${hvm.adhanData!.year} ',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.only(top: 15, bottom: 100),
                itemCount: times.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 214, 214, 214),
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          offset: const Offset(3, 4),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          names[index],
                          style: const TextStyle(fontSize: 24),
                        ),
                        Text(
                          times[index],
                          style: const TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      );
    }
  }
}