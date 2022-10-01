import 'package:flutter/material.dart';

class AudioList extends StatelessWidget {
  final Widget icon;
  const AudioList({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        padding: const EdgeInsets.all(10),
        height: screenHeight * 0.8,
        width: screenWidth,
        child: ListView.separated(
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 7,
          separatorBuilder: (buildContext, index) {
            return const Divider();
          },
          itemBuilder: (buildContext, index) {
            return ListTile(
              title: Text(
                'عنوان $index',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('التاريخ $index'),
              trailing: icon,
            );
          },
        ));
  }
}
