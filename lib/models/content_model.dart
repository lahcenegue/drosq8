class LinkModel {
  String id;
  String link;
  LinkModel({
    required this.id,
    required this.link,
  });

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      id: json['id'],
      link: json['link'],
    );
  }
}

//likaty List
class LinkList {
  final List<dynamic> listLink;

  LinkList({
    required this.listLink,
  });

  factory LinkList.fromJson(Map<String, dynamic> json) {
    return LinkList(
      listLink: json['likaty'],
    );
  }
}
