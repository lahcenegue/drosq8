import 'package:drosq8/models/categories_model.dart';

class CategoriesViewModel {
  final CategoriesModel _categories;

  CategoriesViewModel({required CategoriesModel categories})
      : _categories = categories;

  String get name {
    return _categories.name;
  }

  String get id {
    return _categories.id;
  }

  String get cat {
    return _categories.category;
  }

  String get type {
    return _categories.type;
  }
}
