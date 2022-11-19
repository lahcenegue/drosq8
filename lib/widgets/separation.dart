import 'package:flutter/material.dart';
import '../constants/constant.dart';

class Separation extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const Separation({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      width: screenwidth,
      decoration: BoxDecoration(
        color: ConstantManager.mainColor,
      ),
      child: Stack(children: [
        Positioned(
          bottom: 0,
          child: Container(
            color: Colors.blue,
            height: 10,
            width: screenwidth,
          ),
        ),
        Positioned(
          child: Container(
            padding: const EdgeInsets.only(
              right: 10,
              top: 5,
            ),
            color: Colors.blue,
            height: 60,
            width: 150,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
            left: 15,
            bottom: 20,
            child: GestureDetector(
              onTap: onTap,
              child: const Text(
                'المزيد',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                ),
              ),
            ))
      ]),
    );
  }
}
