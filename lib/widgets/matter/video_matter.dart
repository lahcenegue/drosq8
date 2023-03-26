import 'package:drosq8/Views/show/youtbe_viewer.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 30,
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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(08),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // image
                  SizedBox(
                    height: 150,
                    child: SvgPicture.asset(
                      ConstantManager.video,
                      fit: BoxFit.contain,
                      height: 100,
                      alignment: Alignment.center,
                    ),
                  ),

                  // text
                  Container(
                    height: 80,
                    width: double.infinity,
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF1F0FD),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(08),
                          bottomRight: Radius.circular(08)),
                    ),
                    child: Text(hvm[index].name,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.cairo(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
