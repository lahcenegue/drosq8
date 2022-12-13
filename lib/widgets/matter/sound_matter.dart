import 'package:drosq8/Views/show/audio_player.dart';
import 'package:flutter/material.dart';

class SoundMatter extends StatelessWidget {
  final List<dynamic> hvm;

  const SoundMatter({
    super.key,
    required this.hvm,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      itemCount: hvm.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Mp3Player(
                        catId: hvm[index].id,
                        name: hvm[index].name,
                      )),
            );
          },
          title: Text(
            hvm[index].name,
            style: const TextStyle(fontSize: 20),
          ),
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.play_arrow,
              size: 32,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
