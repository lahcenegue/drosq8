import 'package:drosq8/models/content_model.dart';

class LinkViewModel {
  final LinkModel _linkModel;

  LinkViewModel({required LinkModel linkModel}) : _linkModel = linkModel;

  String get id {
    return _linkModel.id;
  }

  String get comm {
    return _linkModel.comm;
  }

  String get link {
    return _linkModel.link;
  }
}

class ContentViewModel {
  final ContentModel _contentModel;

  ContentViewModel({required ContentModel contentModel})
      : _contentModel = contentModel;

  String get id {
    return _contentModel.id!;
  }

  String get name {
    return _contentModel.name!;
  }

  String get comment {
    return _contentModel.comment!;
  }

  String get link {
    if (_contentModel.likaty!.isEmpty) {
      return '';
    } else {
      return _contentModel.likaty!.first.link!;
    }
  }
}
