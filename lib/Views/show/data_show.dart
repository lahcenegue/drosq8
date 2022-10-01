import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:drosq8/Views/show/audio_player.dart';
import 'package:drosq8/Views/show/pdf_viewer.dart';
import 'package:flutter/material.dart';

class DataShow extends StatefulWidget {
  final String catId;
  final String name;
  const DataShow({
    super.key,
    required this.catId,
    required this.name,
  });

  @override
  State<DataShow> createState() => _DataShowState();
}

class _DataShowState extends State<DataShow> {
  HomeViewModel hvm = HomeViewModel();
  @override
  void initState() {
    super.initState();
    hvm.fetchLink(widget.catId);
  }

  @override
  Widget build(BuildContext context) {
    hvm.addListener(() {
      setState(() {});
    });
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: hvm.listLink.contains('.pdf')
            ? PDFShow(
                name: widget.name,
                catId: widget.catId,
              )
            : hvm.listLink.contains('.mp3')
                ? Mp3Player(
                    name: widget.name,
                    catId: widget.catId,
                  )
                : Center(
                    child: Container(
                      height: 100,
                      width: 200,
                      color: Colors.blue,
                      child: const Center(
                          child: Text(
                        'قريبا',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
      ),
    );
  }
}
