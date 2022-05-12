class Notes {
  int? id;
  String? title;
  String? desc;

  Notes({this.id, this.title, this.desc});

  Notes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['desc'] = desc;
    return data;
  }

  static List<Notes> toJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((e) => Notes.fromJson(e)).toList();
  }
}
