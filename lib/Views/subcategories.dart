import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:drosq8/widgets/categories.dart';
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

    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.name),
            bottom: const TabBar(tabs: [
              Tab(text: 'الأقسام'),
              Tab(text: 'المواد'),
            ]),
          ),
          body: TabBarView(
            children: [
              //الاقسام
              CategoriesView(
                catId: widget.catId,
              ),

              // المواد
              hvm.listMatter == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : hvm.listMatter!.isEmpty
                      ? const Center(
                          child: Text('لا يوجد مواد راجع الأقسام'),
                        )
                      : GridView.builder(
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
                          itemCount: hvm.listMatter!.length,
                          itemBuilder: (buildContext, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DataShow(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    // image
                                    hvm.listMatter![index].image.isEmpty
                                        ? Image.asset(
                                            ConstantManager.book,
                                            height: 180,
                                          )
                                        : Image.network(
                                            hvm.listMatter![index].image
                                                    .contains('http')
                                                ? hvm.listMatter![index].image
                                                : '${ConstantManager.url}/${hvm.listMatter![index].image}',
                                            height: 180,
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
            ],
          ),
        ),
      ),
    );
  }
}
