import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';

import 'show/data_show.dart';

class SubCategories extends StatefulWidget {
  final String catId;
  final String name;

  const SubCategories({
    Key? key,
    required this.name,
    required this.catId,
  }) : super(key: key);

  @override
  State<SubCategories> createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
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
    final double screenWidth = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: ListView(
          children: [
            Visibility(
              visible: hvm.listSubCateg.isEmpty ? false : true,
              child: Column(
                children: [
                  Text('أقسام ${widget.name} '),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                        itemCount: hvm.listSubCateg.length,
                        itemBuilder: (buildContext, index) {
                          return Card(
                            elevation: 3,
                            child: ListTile(
                              title: Text(hvm.listSubCateg[index].name),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubCategories(
                                            catId: hvm.listSubCateg[index].id,
                                            name: hvm.listSubCateg[index].name,
                                          )),
                                );
                              },
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: hvm.listMatter.isEmpty ? false : true,
              child: GestureDetector(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: screenWidth,
                      height: 60,
                      decoration: BoxDecoration(
                        color: ConstantManager.mainColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            offset: const Offset(1, 5),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'مواد ${widget.name} ',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 600,
                      child: GridView.builder(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 220,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 30,
                          ),
                          itemCount: hvm.listMatter.length,
                          itemBuilder: (buildContext, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DataShow(
                                            catId: hvm.listMatter[index].id,
                                            name: hvm.listMatter[index].name,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    // image
                                    hvm.listMatter[index].image.isEmpty
                                        ? Image.asset(
                                            ConstantManager.book,
                                            height: 180,
                                          )
                                        : Image.network(
                                            '${ConstantManager.url}/${hvm.listMatter[index].image}',
                                            height: 180,
                                          ),

                                    // text
                                    Text(
                                      hvm.listMatter[index].name,
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




            // matter list

            // Visibility(
            //   visible: hvm.listMatter.isEmpty ? false : true,
            //   child: Column(
            //     children: [
            //       Text('المواد ${widget.name} '),
            //       SizedBox(
            //         height: 400,
            //         child: ListView.builder(
            //             itemCount: hvm.listMatter.length,
            //             itemBuilder: (buildContext, index) {
            //               return Card(
            //                 elevation: 3,
            //                 child: ListTile(
            //                   leading: hvm.listMatter[index].image.isEmpty
            //                       ? SizedBox(
            //                           height: 50,
            //                           width: 100,
            //                           child: Image.asset(ConstantManager.book),
            //                         )
            //                       : Image.network(
            //                           '${ConstantManager.url}/${hvm.listMatter[index].image}'),
            //                   title: Text(
            //                     hvm.listMatter[index].name,
            //                   ),
            //                   onTap: () {
            //                     Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                           builder: (context) => ContentScreen(
            //                                 catId: hvm.listMatter[index].id,
            //                                 name: hvm.listMatter[index].name,
            //                               )),
            //                     );
            //                   },
            //                 ),
            //               );
            //             }),
            //       ),
            //     ],
            //   ),
            // ),