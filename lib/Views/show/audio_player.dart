import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../View_Models/home_view_model.dart';

class Mp3Player extends StatefulWidget {
  final String catId;
  final String name;
  const Mp3Player({super.key, required this.name, required this.catId});

  @override
  State<Mp3Player> createState() => _Mp3PlayerState();
}

class _Mp3PlayerState extends State<Mp3Player> {
  HomeViewModel hvm = HomeViewModel();
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    //hvm.fetchLink(widget.catId);
    hvm.fetchContentData(widget.catId);

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    hvm.addListener(() {
      if (mounted) {
        setState(() {
          // Your state change code goes here
        });
      }
    });

    if (hvm.contentData == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.name),
          ),
          body: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                height: 220,
                width: 220,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF1e84c4),
                      Color(0xFF0f4363),
                    ],
                  ),
                ),
                child: Image.asset(ConstantManager.sound),
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Text(
                  widget.name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.cairo(
                      textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
                ),
              ),
              const SizedBox(height: 70),
              SliderTheme(
                data: const SliderThemeData(
                  trackHeight: 5,
                ),
                child: Slider(
                  thumbColor: Colors.white,
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  activeColor: const Color(0xFF1E85C6),
                  inactiveColor: const Color(0xFFD9D9D9),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);
                    //await audioPlayer.resume();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration - position)),
                  ],
                ),
              ),
              Container(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: IconButton(
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.play(UrlSource(
                          'https://www.drosq8.com/${hvm.contentData!.link}'));
                      // await audioPlayer.play(
                      //     'https://www.drosq8.com/${hvm.contentData!.link}');
                    }
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  color: ConstantManager.mainColor,
                  iconSize: 28,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return [
    if (duration.inHours > 0) hours,
    minutes,
    seconds,
  ].join(':');
}
