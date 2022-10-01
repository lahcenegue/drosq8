import 'package:drosq8/models/content_model.dart';

class LinkViewModel {
  final LinkModel _linkModel;

  LinkViewModel({required LinkModel linkModel}) : _linkModel = linkModel;

  String get id {
    return _linkModel.id;
  }

  String get link {
    return _linkModel.link;
  }
}
