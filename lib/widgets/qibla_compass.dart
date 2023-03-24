import 'package:drosq8/Views/main_screens/qibla/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' show pi;

class QiblahCompassWidget extends StatelessWidget {
  // final _compassSvg = SvgPicture.asset('assets/images/compass.svg');
  final _compassSvg = Image.asset('assets/images/compass2.png');
  final _needleSvg = Image.asset(
    'assets/images/kaaba.png',
    height: 40,
  );
  // final _needleSvg = SvgPicture.asset(
  //   'assets/images/needle.svg',
  //   fit: BoxFit.contain,
  //   height: 300,
  //   alignment: Alignment.center,
  // );

  QiblahCompassWidget({super.key});

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
            Transform.rotate(
              angle: 0,
              //angle: (qiblahDirection.qiblah * (pi / 180) * -1),
              alignment: Alignment.center,
              child: _needleSvg,
            ),
            const SizedBox(height: 60),
            Transform.rotate(
              angle: (qiblahDirection.direction * (pi / 180) * -1),
              child: _compassSvg,
            ),
            const SizedBox(height: 50),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F0FD),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Text("${qiblahDirection.offset.toStringAsFixed(3)}°")
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
