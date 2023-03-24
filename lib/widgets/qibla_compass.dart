import 'package:drosq8/Views/main_screens/qibla/loading_indicator.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' show pi;

import 'package:google_fonts/google_fonts.dart';

class QiblahCompassWidget extends StatelessWidget {
  const QiblahCompassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        }

        final qiblahDirection = snapshot.data!;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              ConstantManager.kaaba,
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.08,
              alignment: Alignment.center,
              color: qiblahDirection.offset.round() ==
                      qiblahDirection.direction.round()
                  ? Colors.green
                  : Colors.black,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: (qiblahDirection.qiblah * (pi / 180) * -1),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      ConstantManager.arrow,
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height * 0.50,
                      alignment: Alignment.center,
                    ),
                  ),

                  //boussol
                  Transform.rotate(
                    angle: (qiblahDirection.direction * (pi / 180) * -1),
                    child: SvgPicture.asset(
                      ConstantManager.compass,
                      height: MediaQuery.of(context).size.height * 0.50,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F0FD),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/move.png',
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "زاوية القبلة:",
                    style: GoogleFonts.cairo(
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.25),
                  Text(
                    "${qiblahDirection.offset.toStringAsFixed(3)}°",
                    style: GoogleFonts.cairo(
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
