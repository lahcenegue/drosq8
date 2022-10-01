import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String name;
  final Function() onTap;

  const CustomListTile({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(fontSize: 20),
        ),
        trailing: const Icon(Icons.arrow_back_ios_new),
        onTap: onTap,
      ),
    );
  }
}
