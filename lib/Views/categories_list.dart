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
      child: hvm.listCateg.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              physics: const ScrollPhysics(),
              itemCount: hvm.listCateg.length,
              itemBuilder: (buildContext, index) {
                var cat = hvm.listCateg[index];
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


