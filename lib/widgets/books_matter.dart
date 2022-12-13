import 'package:drosq8/Views/show/data_show.dart';
import 'package:drosq8/constants/constant.dart';
import 'package:flutter/material.dart';

class BooksMatter extends StatelessWidget {
  final List<dynamic> hvm;

  const BooksMatter({
    super.key,
    required this.hvm,
  });

  @override
  Widget build(BuildContext context) {
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
      itemCount: hvm.length,
      itemBuilder: (buildContext, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DataShow(
                        catId: hvm[index].id,
                        name: hvm[index].name,
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
                hvm[index].image.isEmpty ||
                        hvm[index].image.contains('upload/upload/')
                    ? Image.asset(
                        ConstantManager.book,
                        height: 180,
                      )
                    : Image.network(
                        hvm[index].image.contains('http')
                            ? hvm[index].image
                            : '${ConstantManager.url}/${hvm[index].image}',
                        height: 180,
                      ),

                // text
                Text(
                  hvm[index].name,
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
      },
    );
  }
}
