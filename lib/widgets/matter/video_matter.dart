import 'package:drosq8/Views/show/youtbe_viewer.dart';
import 'package:flutter/material.dart';

class VideoMatter extends StatelessWidget {
  final List<dynamic> hvm;
  //final String link;

  const VideoMatter({
    super.key,
    required this.hvm,
    //required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 4 / 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 30,
        ),
        itemCount: hvm.length,
        itemBuilder: (buildContext, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GetVideoLink(
                          name: hvm[index].name,
                          catId: hvm[index].id,
                        )),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/images/video.png',
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  Text(
                    hvm[index].name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
