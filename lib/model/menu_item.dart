class MenuItem {
  String id;
  String title;
  String imageUrl;

  MenuItem({this.id, this.title, this.imageUrl});

  MenuItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    return data;
  }

  MenuItem.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        title = data['title'],
        imageUrl = data['imageUrl'];
}