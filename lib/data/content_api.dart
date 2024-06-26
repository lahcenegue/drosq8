import 'package:drosq8/constants/constant.dart';
import 'package:drosq8/models/content_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ContentApi {
  String catId;
  ContentApi({
    required this.catId,
  });

  Future<ContentModel> fetchContent() async {
    try {
      var url = Uri.parse('${ConstantManager.url}/api/play/$catId/');

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var data = convert.jsonDecode(response.body);
        ContentModel content = ContentModel.fromJson(data);
        return content;
      }
    } catch (e) {
      throw Exception(e);
    }
    return ContentModel();
  }
}
