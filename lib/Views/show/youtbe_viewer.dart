import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeViewer extends StatefulWidget {
  // final String catId;
  final String name;
  final String link;
  const YoutubeViewer({
    super.key,
    required this.link,
    required this.name,
    // required this.catId,
  });

  @override
  State<YoutubeViewer> createState() => _YoutubeViewerState();
}

class _YoutubeViewerState extends State<YoutubeViewer> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.link)!,
    );
    super.initState();
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF3283bb),
              Color(0xFFd1e3f0),
            ],
          ),
        ),
        child: Center(
          child: YoutubePlayerBuilder(
            player: YoutubePlayer(controller: controller),
            builder: (context, player) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(widget.name),
                  ),
                  body: Center(child: player),
                ),
              );
            },
          ),
        ));
  }
}
