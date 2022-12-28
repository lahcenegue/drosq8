import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:drosq8/widgets/matter/article_matter.dart';
import 'package:drosq8/widgets/matter/books_matter.dart';
import 'package:drosq8/widgets/matter/sound_matter.dart';
import 'package:drosq8/widgets/matter/video_matter.dart';
import 'package:flutter/material.dart';

class MatterView extends StatefulWidget {
  final String catId;
  final String type;
  final String catName;
  const MatterView({
    super.key,
    required this.catId,
    required this.type,
    required this.catName,
  });

  @override
  State<MatterView> createState() => _MatterViewState();
}

class _MatterViewState extends State<MatterView> {
  HomeViewModel hvm = HomeViewModel();
  @override
  void initState() {
    super.initState();
    hvm.fetchMatter(widget.catId);
  }

  @override
  Widget build(BuildContext context) {
    hvm.addListener(() {
      setState(() {});
    });

    if (hvm.listMatter == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      if (widget.type == 'book') {
        return BooksMatter(
          hvm: hvm.listMatter!,
        );
      } else if (widget.type == 'sound') {
        return SoundMatter(
          hvm: hvm.listMatter!,
        );
      } else if (widget.type == 'video') {
        return VideoMatter(
          hvm: hvm.listMatter!,
        );
      } else if (widget.type == 'article') {
        return ArticleMatter(
          hvm: hvm.listMatter!,
        );
      } else {
        return const Center(
          child: Text(
            'قريبا...',
            style: TextStyle(fontSize: 32),
          ),
        );
      }
    }
  }
}
