import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:drosq8/widgets/categories.dart';
import 'package:drosq8/widgets/matter.dart';
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
              MatterView(
                catId: widget.catId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
