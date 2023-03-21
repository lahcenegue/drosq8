import 'package:flutter/material.dart';

Widget imageLink({
  required String? link,
  required Function()? onPressed,
}) {
  return Container(
    padding: const EdgeInsets.all(5),
    height: 60,
    width: 60,
    child: GestureDetector(
      onTap: onPressed,
      child: Image.asset(
        '$link',
      ),
    ),
  );
}
