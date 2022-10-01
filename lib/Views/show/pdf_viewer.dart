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
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: SfPdfViewer.network(
          'https://www.drosq8.com/${hvm.listLink}',
          key: _pdfViewerKey,
        ),
      ),
    );
  }
}
