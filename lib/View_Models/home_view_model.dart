import 'package:drosq8/View_Models/categories/categories_view_model.dart';
import 'package:drosq8/View_Models/content/content_view_model.dart';
import 'package:drosq8/View_Models/subcategories/sub_view_model.dart';
import 'package:drosq8/data/categories_api.dart';
import 'package:drosq8/data/content_api.dart';
import 'package:drosq8/data/subcategories_api.dart';
import 'package:drosq8/models/categories_model.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  List<CategoriesViewModel>? listCateg;
  List<SubCategoriesViewModel>? listSubCateg;
  List<SubCategoriesViewModel>? listSubCateg2;
  List<MatterViewModel>? listMatter;
  List<String> listId = [];
  List<String> listLinkAudio = [];
  String listLink = "";

//Categories list
  Future<void> fetchCategories() async {
    List<CategoriesModel> jsonMapCat = await CategoriesApi().loadData();

    jsonMapCat.removeWhere((element) => element.category == 'page');

    listCateg =
        jsonMapCat.map((e) => CategoriesViewModel(categories: e)).toList();
    notifyListeners();
  }

  //SubCategories List
  Future<void> fetchSubCategories(String catid) async {
    print('=========1=========');
    List jsonMap = await SubCategoriesApi(catId: catid).loadSubCat();
    print('=========2=========');
    listSubCateg =
        jsonMap.map((e) => SubCategoriesViewModel(subcategories: e)).toList();
    print('=========3=========');
    notifyListeners();
  }

  // Matter List
  Future<void> fetchMatter(String catid) async {
    List jsonMatter = await SubCategoriesApi(catId: catid).loadMatter();
    listMatter =
        jsonMatter.map((e) => MatterViewModel(matterModel: e)).toList();

    notifyListeners();
  }

  //Contents
  Future<void> fetchLink(String catid) async {
    List jsonContent = await ContentApi(catId: catid).loadLink();

    List listLink2 =
        jsonContent.map((e) => LinkViewModel(linkModel: e)).toList();
    listLink = listLink2[0].link;

    notifyListeners();
  }

  //list audio
  Future<void> fetchListAudio(String catid) async {
    List jsonMap = await SubCategoriesApi(catId: catid).loadSubCat();

    listSubCateg2 =
        jsonMap.map((e) => SubCategoriesViewModel(subcategories: e)).toList();

    for (int i = 0; i < 6; i++) {
      listId.add(listSubCateg2![i].id);
      fetchSubCategories(listSubCateg2![i].id);
      listLinkAudio.add(value)
      // listLinkAudio.add('');
      // print('--------------------test----------------');
      // print(listSubCateg![i].id);
    }
    print(listId);
    // print(listSubCateg![1].id);
    notifyListeners();
  }
}
