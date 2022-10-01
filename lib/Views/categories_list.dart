import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:drosq8/widgets/list_tile.dart';
import 'package:flutter/material.dart';

import 'subcategories.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  HomeViewModel hvm = HomeViewModel();
  @override
  void initState() {
    super.initState();
    hvm.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    hvm.addListener(() {
      setState(() {});
    });
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: ListView.builder(
          itemCount: hvm.listCateg.length,
          itemBuilder: (buildContext, index) {
            var cat = hvm.listCateg[index];
            return Card(
              elevation: 2,
              child: ListTile(
                title: Text(
                  cat.name,
                  style: const TextStyle(fontSize: 20),
                ),
                trailing: const Icon(Icons.arrow_back_ios_new),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubCategories(
                              catId: cat.id,
                              name: cat.name,
                            )),
                  );
                },
              ),
            );
          }),
    );
  }
}


// ListView(
//         children: [
//           CustomListTile(
//             name: 'كتب إلكترونية',
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const SubCategories(
//                           catId: '260',
//                           name: 'كتب إلكترونية',
//                         )),
//               );
//             },
//           ),
//         ],
//       ),


