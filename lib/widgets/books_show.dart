import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:drosq8/Views/show/pdf_viewer.dart';

import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';

class BooksShow extends StatefulWidget {
  final String catId;

  const BooksShow({
    Key? key,
    required this.catId,
  }) : super(key: key);

  @override
  State<BooksShow> createState() => _BooksShowState();
}

class _BooksShowState extends State<BooksShow> {
  HomeViewModel hvm = HomeViewModel();
  @override
  void initState() {
    super.initState();
    hvm.fetchSubCategories(widget.catId);
    hvm.fetchMatter(widget.catId);
  }

  @override
  Widget build(BuildContext context) {
    hvm.addListener(() {
      setState(() {});
    });

    return SizedBox(
      height: 500,
      child: hvm.listMatter == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              itemCount:
                  hvm.listMatter!.length > 4 ? 4 : hvm.listMatter!.length,
              itemBuilder: (buildContext, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFShow(
                                catId: hvm.listMatter![index].id,
                                name: hvm.listMatter![index].name,
                              )),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // image
                        hvm.listMatter![index].image.isEmpty ||
                                hvm.listMatter![index].image == null
                            ? Image.asset(
                                ConstantManager.book,
                                height: 150,
                              )
                            : Image.network(
                                '${ConstantManager.url}/${hvm.listMatter![index].image}',
                                height: 150,
                              ),

                        // text
                        Text(
                          hvm.listMatter![index].name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
