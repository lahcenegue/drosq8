import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:drosq8/Views/subcategories.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatefulWidget {
  final String catId;
  final String type;
  const CategoriesView({
    super.key,
    required this.catId,
    required this.type,
  });

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  HomeViewModel hvm = HomeViewModel();
  @override
  void initState() {
    super.initState();
    hvm.fetchSubCategories(widget.catId);
  }

  @override
  Widget build(BuildContext context) {
    hvm.addListener(() {
      setState(() {});
    });
    return hvm.listSubCateg == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: hvm.listSubCateg!.length,
            itemBuilder: (buildContext, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      offset: const Offset(3, 4),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(hvm.listSubCateg![index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubCategories(
                                catId: hvm.listSubCateg![index].id,
                                name: hvm.listSubCateg![index].name,
                                type: widget.type,
                              )),
                    );
                  },
                ),
              );
            });
  }
}
