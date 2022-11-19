// الاقسام model
class SubCategoriesModel {
  final String name;
  final String id;

  SubCategoriesModel({
    required this.name,
    required this.id,
  });

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    return SubCategoriesModel(
      name: json['catname'],
      id: json['catid'],
    );
  }
}

// for Categories
class ListSubModel {
  final List<dynamic> listSubModel;

  ListSubModel({
    required this.listSubModel,
  });

  factory ListSubModel.fromJson(Map<String, dynamic> json) {
    return ListSubModel(
      listSubModel: json['cat'],
    );
  }
}

// المواد Model
class MatterModel {
  final String id;
  final String name;
  final String comm;
  final String image;
  MatterModel({
    required this.id,
    required this.name,
    required this.comm,
    required this.image,
  });
  factory MatterModel.fromJson(Map<String, dynamic> json) {
    return MatterModel(
      id: json['id'],
      name: json['name'],
      comm: json['comm'],
      image: json['image'],
    );
  }
}

// Matters
class ListMatter {
  final List<dynamic> listMatter;

  ListMatter({
    required this.listMatter,
  });

  factory ListMatter.fromJson(Map<String, dynamic> json) {
    return ListMatter(
      listMatter: json['play'],
    );
  }
}
