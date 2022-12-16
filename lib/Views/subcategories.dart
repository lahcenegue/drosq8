import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:drosq8/widgets/categories.dart';
import 'package:drosq8/widgets/matter.dart';
import 'package:flutter/material.dart';

class SubCategories extends StatefulWidget {
  final String catId;
  final String name;
  final String type;

  const SubCategories({
    Key? key,
    required this.name,
    required this.catId,
    required this.type,
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

    if (hvm.listSubCateg == null || hvm.listMatter == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: DefaultTabController(
          length: hvm.listSubCateg!.isEmpty || hvm.listMatter!.isEmpty ? 1 : 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.name),
              bottom: hvm.listSubCateg!.isEmpty
                  ? const TabBar(tabs: [
                      Tab(text: 'المواد'),
                    ])
                  : hvm.listMatter!.isEmpty
                      ? const TabBar(tabs: [
                          Tab(text: 'الأقسام'),
                        ])
                      : const TabBar(tabs: [
                          Tab(text: 'الأقسام'),
                          Tab(text: 'المواد'),
                        ]),
            ),
            body: hvm.listSubCateg!.isEmpty
                ? TabBarView(children: [
                    // المواد
                    MatterView(
                      catName: widget.name,
                      catId: widget.catId,
                      type: widget.type,
                    ),
                  ])
                : hvm.listMatter!.isEmpty
                    ? TabBarView(children: [
                        //الاقسام
                        CategoriesView(
                          catId: widget.catId,
                          type: widget.type,
                        ),
                      ])
                    : TabBarView(
                        children: [
                          //الاقسام
                          CategoriesView(
                            catId: widget.catId,
                            type: widget.type,
                          ),

                          // المواد
                          MatterView(
                            catId: widget.catId,
                            catName: widget.name,
                            type: widget.type,
                          ),
                        ],
                      ),
          ),
        ),
      );
    }
  }
}
