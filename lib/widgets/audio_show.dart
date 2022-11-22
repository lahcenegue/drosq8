import 'package:audioplayers/audioplayers.dart';
import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';

class AudioShow extends StatefulWidget {
  const AudioShow({
    Key? key,
  }) : super(key: key);

  @override
  State<AudioShow> createState() => _AudioShowState();
}

class _AudioShowState extends State<AudioShow> {
  HomeViewModel hvm = HomeViewModel();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    hvm.fetchListAudio(ConstantManager.audiosId);
    //hvm.fetchLink(widget.catId);
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    hvm.addListener(() {
      setState(() {});
    });

    return SizedBox(
      height: 500,
      child: hvm.listId.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: 4,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (buildContext, index) {
                return ListTile(
                  trailing: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: ConstantManager.mainColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: IconButton(
                        onPressed: () async {
                          if (isPlaying) {
                            await audioPlayer.pause();
                          } else {
                            await audioPlayer.play(
                                'https://www.drosq8.com/upload3/drosq8--16652635591.mp3}');
                          }
                        },
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                        ),
                        iconSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Text('test'),
                );
              }),
    );
  }
}


// GridView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               padding: const EdgeInsets.all(20),
//               gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 220,
//                 childAspectRatio: 3 / 4,
//                 crossAxisSpacing: 30,
//                 mainAxisSpacing: 30,
//               ),
//               itemCount:
//                   hvm.listMatter!.length > 4 ? 4 : hvm.listMatter!.length,
//               itemBuilder: (buildContext, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => PDFShow(
//                                 catId: hvm.listMatter![index].id,
//                                 name: hvm.listMatter![index].name,
//                               )),
//                     );
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         width: 1,
//                         color: Colors.black,
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         // image
//                         hvm.listMatter![index].image.isEmpty
//                             ? Image.asset(
//                                 ConstantManager.book,
//                                 height: 150,
//                               )
//                             : Image.network(
//                                 '${ConstantManager.url}/${hvm.listMatter![index].image}',
//                                 height: 150,
//                               ),

//                         // text
//                         Text(
//                           hvm.listMatter![index].name,
//                           textAlign: TextAlign.center,
//                           maxLines: 2,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               })