import 'package:drosq8/models/subcatgiries_model.dart';

class SubCategoriesViewModel {
  final SubCategoriesModel _subcategories;

  SubCategoriesViewModel({required SubCategoriesModel subcategories})
      : _subcategories = subcategories;

  String get name {
    return _subcategories.name;
  }

  String get id {
    return _subcategories.id;
  }
}

// المواد view Model

class MatterViewModel {
  final MatterModel _matterModel;

  MatterViewModel({required MatterModel matterModel})
      : _matterModel = matterModel;

  String get name {
    return _matterModel.name;
  }

  String get id {
    return _matterModel.id;
  }

  String get image {
    return _matterModel.image;
  }

  String get comm {
    return _matterModel.comm;
  }
}
