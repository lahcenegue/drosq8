import 'dart:convert' as convert;

import 'package:drosq8/constants/constant.dart';
import 'package:http/http.dart' as http;
import 'package:drosq8/models/adan_model.dart';

class AdanApi {
  Future<AdhanModel> fetchAdan() async {
    print('===========api');
    print('===========1');
    try {
      var url = Uri.parse(ConstantManager.adanLink + ConstantManager.adress);
      print(url);
      http.Response response = await http.get(url);
      print('===========2');
      print(response.statusCode);
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
