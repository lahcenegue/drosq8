import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'subcategories.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  HomeViewModel hvm = HomeViewModel();
  @override
  void initState() {
    super.initState();
    hvm.fetchCategories();
  }

  Future refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    hvm.fetchCategories();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    hvm.addListener(() {
      setState(() {});
    });

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(ConstantManager.name),
        ),
        body: hvm.listCateg == null || hvm.listCateg!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: refreshData,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ListView.builder(
                    physics: const ScrollPhysics(),
                    itemCount: hvm.listCateg!.length,
                    itemBuilder: (buildContext, index) {
                      return Container(
                        margin:
                            const EdgeInsets.only(right: 25, left: 25, top: 16),
                        padding: const EdgeInsets.only(right: 45),
                        decoration: BoxDecoration(
                          color: const Color(0xffF1F0FD),
                          borderRadius: BorderRadius.circular(8),
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
                            hvm.listCateg![index].name,
                            style: GoogleFonts.cairo(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          trailing: const Icon(Icons.arrow_back_ios_new),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubCategories(
                                  catId: hvm.listCateg![index].id,
                                  name: hvm.listCateg![index].name,
                                  type: hvm.listCateg![index].type,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
