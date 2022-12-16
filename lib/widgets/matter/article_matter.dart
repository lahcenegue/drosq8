import 'package:drosq8/Views/show/article_show.dart';
import 'package:flutter/material.dart';

class ArticleMatter extends StatelessWidget {
  final List<dynamic> hvm;

  const ArticleMatter({
    super.key,
    required this.hvm,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10),
            itemCount: hvm.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticleShow(
                              title: hvm[index].name,
                              id: hvm[index].id,
                            )),
                  );
                },
                title: Text(
                  hvm[index].name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  hvm[index].comm,
                  textAlign: TextAlign.justify,
                ),
                leading: const Icon(
                  Icons.snippet_folder_rounded,
                  size: 40,
                ),
              );
            }));
  }
}
