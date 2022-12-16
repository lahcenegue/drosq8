import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ArticleShow extends StatefulWidget {
  final String id;
  final String title;
  const ArticleShow({
    super.key,
    required this.id,
    required this.title,
  });

  @override
  State<ArticleShow> createState() => _ArticleShowState();
}

class _ArticleShowState extends State<ArticleShow> {
  HomeViewModel hvm = HomeViewModel();

  @override
  void initState() {
    super.initState();
    hvm.fetchContentData(widget.id);
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
            title: Text(widget.title),
          ),
          body: hvm.contentData == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: FittedBox(
                        child: Text(
                          hvm.contentData!.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Html(
                      data: hvm.contentData!.comment,
                      style: {},
                    ),
                  ],
                ),
        ),
      );
    }
  }
}
