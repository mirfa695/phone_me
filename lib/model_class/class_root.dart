class Root {
  int? userId;
  int? id;
  String? title;

  Root({this.userId, this.id, this.title});

  Root.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}

