import 'dart:convert' as convert;

import 'package:drosq8/constants/constant.dart';
import 'package:http/http.dart' as http;
import 'package:drosq8/models/adan_model.dart';

class AdanApi {
  Future<AdhanModel> fetchAdan() async {
    try {
      var url = Uri.parse(ConstantManager.adanLink + ConstantManager.adress);

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body);
        AdhanModel adan = AdhanModel.fromJson(data);
        return adan;
      }
    } catch (e) {
      throw Exception(e);
    }
    return AdhanModel();
  }
}
