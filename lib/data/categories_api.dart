import 'dart:convert' as convert;
import 'package:drosq8/constants/constant.dart';
import 'package:drosq8/models/categories_model.dart';
import 'package:http/http.dart' as http;

class CategoriesApi {
  Future<List<CategoriesModel>> loadData() async {
    try {
      var url = Uri.parse('${ConstantManager.url}/api');
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body);

        Iterable list = data;
        List<CategoriesModel> categoriesList =
            list.map((e) => CategoriesModel.fromJson(e)).toList();

        return categoriesList;
      }
    } catch (e) {
      throw Exception(e);
    }
    return [];
  }
}
