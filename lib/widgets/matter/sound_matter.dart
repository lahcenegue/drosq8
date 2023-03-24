import 'package:drosq8/Views/show/audio_player.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SoundMatter extends StatelessWidget {
  final List<dynamic> hvm;

  const SoundMatter({
    super.key,
    required this.hvm,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      itemCount: hvm.length,
      itemBuilder: (context, index) {
        return GestureDetector(
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
          child: Container(
            margin: const EdgeInsets.only(right: 25, left: 25, top: 16),
            padding: const EdgeInsets.only(left: 10),
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F0FD),
              borderRadius: BorderRadius.circular(08),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDFDCFF),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(08),
                        bottomRight: Radius.circular(08)),
                  ),
                  child: Image.asset(
                    ConstantManager.soundIcon,
                  ),
                ),
                const SizedBox(width: 05),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.52,
                  child: Text(
                    hvm[index].name,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(),
                  ),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.arrow_back_ios_new),
              ],
            ),
          ),
        );
      },
    );
  }
}



//Container(
        //   margin: const EdgeInsets.only(right: 25, left: 25, top: 16),
        //   decoration: BoxDecoration(
        //     color: const Color(0xffF1F0FD),
        //     borderRadius: BorderRadius.circular(8),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.grey.withOpacity(0.7),
        //         offset: const Offset(3, 4),
        //         blurRadius: 5,
        //       ),
        //     ],
        //   ),
        //   child: ListTileTheme(
        //     tileColor: const Color(0xFFF1F0FD),
        //     shape:
        //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        //     child: ListTile(
        //       leading: Container(
        //           decoration: const BoxDecoration(
        //             color: Color(0xFFDFDCFF),
        //           ),
        //           child: Image.asset(ConstantManager.sound)),
        //       trailing: const Icon(Icons.arrow_back_ios_new),
        //       onTap: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => Mp3Player(
        //                     catId: hvm[index].id,
        //                     name: hvm[index].name,
        //                   )),
        //         );
        //       },
        //       title: Text(
        //         hvm[index].name,
        //         overflow: TextOverflow.ellipsis,
        //         style: const TextStyle(fontSize: 20),
        //       ),
        //     ),
        //   ),
        // );
