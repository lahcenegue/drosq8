import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

class PDFShow extends StatefulWidget {
  final String catId;
  final String name;
  const PDFShow({
    Key? key,
    required this.name,
    required this.catId,
  }) : super(key: key);

  @override
  State<PDFShow> createState() => _PDFShowState();
}

class _PDFShowState extends State<PDFShow> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  HomeViewModel hvm = HomeViewModel();
  @override
  void initState() {
    super.initState();
    //hvm.fetchLink(widget.catId);
    hvm.fetchContentData(widget.catId);
  }

  @override
  Widget build(BuildContext context) {
    hvm.addListener(() {
      setState(() {});
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
          body: hvm.contentData!.link.contains('https://')
              ? SfPdfViewer.network(
                  hvm.contentData!.link,
                  key: _pdfViewerKey,
                )
              : SfPdfViewer.network(
                  'https://www.drosq8.com/${hvm.contentData!.link}',
                  key: _pdfViewerKey,
                ),
        ),
      );
    }
  }
}
