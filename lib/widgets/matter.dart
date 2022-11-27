import 'package:drosq8/View_Models/home_view_model.dart';
import 'package:drosq8/Views/show/data_show.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';

class MatterView extends StatefulWidget {
  final String catId;
  const MatterView({
    super.key,
    required this.catId,
  });

  @override
  State<MatterView> createState() => _MatterViewState();
}

class _MatterViewState extends State<MatterView> {
  HomeViewModel hvm = HomeViewModel();
  @override
  void initState() {
    super.initState();
    hvm.fetchMatter(widget.catId);
  }

  @override
  Widget build(BuildContext context) {
    hvm.addListener(() {
      setState(() {});
    });

    if (hvm.listMatter == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return GridView.builder(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // image
                    hvm.listMatter![index].image.isEmpty
                        ? Image.asset(
                            ConstantManager.book,
                            height: 180,
                          )
                        : Image.network(
                            hvm.listMatter![index].image.contains('http')
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
          });
    }
  }
}
