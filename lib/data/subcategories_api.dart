import 'package:drosq8/constants/constant.dart';
import 'package:drosq8/models/subcatgiries_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SubCategoriesApi {
  String catId;
  SubCategoriesApi({
    required this.catId,
  });

// SubCategories list
  Future<List<SubCategoriesModel>> loadSubCat() async {
    try {
      var url = Uri.parse('${ConstantManager.url}/api/cat/$catId/');

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body);

        var listdata = data[0];

        ListSubModel listSubModel = ListSubModel.fromJson(listdata);

        List<SubCategoriesModel> listSubcat = listSubModel.listSubModel
            .map((e) => SubCategoriesModel.fromJson(e))
            .toList();

        return listSubcat;
      }
    } catch (e) {
      throw Exception(e);
    }
    return [];
  }

  // MatterList api

  Future<List<MatterModel>> loadMatter() async {
    try {
      var url = Uri.parse('${ConstantManager.url}/api/cat/$catId/');

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body);

        var listdata = data[0];

        ListMatter listMatterModel = ListMatter.fromJson(listdata);

        List<MatterModel> listMatter = listMatterModel.listMatter
            .map((e) => MatterModel.fromJson(e))
            .toList();

        return listMatter;
      }
    } catch (e) {
      throw Exception(e);
    }
    return [];
  }
}
