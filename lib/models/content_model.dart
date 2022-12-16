class LinkModel {
  String id;
  String link;
  String comm;
  LinkModel({
    required this.id,
    required this.link,
    required this.comm,
  });

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      id: json['id'],
      comm: json['comment'],
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

//Content Model
class ContentModel {
  String? id;
  String? catid;
  String? name;
  String? image;
  String? counter;
  String? comment;
  String? comm;
  String? data;
  String? byadd;
  String? ratteb;
  String? count;
  String? vote;
  String? keywords;
  String? tasnif;
  String? linkerror;
  String? catid2;
  List<Likaty>? likaty;

  ContentModel(
      {this.id,
      this.catid,
      this.name,
      this.image,
      this.counter,
      this.comment,
      this.comm,
      this.data,
      this.byadd,
      this.ratteb,
      this.count,
      this.vote,
      this.keywords,
      this.tasnif,
      this.linkerror,
      this.catid2,
      this.likaty});

  ContentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catid = json['catid'];
    name = json['name'];
    image = json['image'];
    counter = json['counter'];
    comment = json['comment'];
    comm = json['comm'];
    data = json['data'];
    byadd = json['byadd'];
    ratteb = json['ratteb'];
    count = json['count'];
    vote = json['vote'];
    keywords = json['keywords'];
    tasnif = json['tasnif'];
    linkerror = json['linkerror'];
    catid2 = json['catid2'];
    if (json['likaty'] != null) {
      likaty = <Likaty>[];
      json['likaty'].forEach((v) {
        likaty!.add(Likaty.fromJson(v));
      });
    }
  }
}

class Likaty {
  String? id;
  String? catsmktba;
  String? order;
  String? name;
  String? link;
  String? visible;
  String? counter;

  Likaty({
    this.id,
    this.catsmktba,
    this.order,
    this.name,
    this.link,
    this.visible,
    this.counter,
  });

  Likaty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catsmktba = json['catsmktba'];
    order = json['order'];
    name = json['name'];
    link = json['link'];
    visible = json['visible'];
    counter = json['counter'];
  }
}
