class Channel {
  String? description;
  int? ID;
  String? name;
  String? picture;
  String? uRL;
  String? categoryname;

  Channel(
      {this.description,
      this.ID,
      this.name,
      this.picture,
      this.uRL,
      this.categoryname});

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      ID: json['ID'],
      name: json['Name'],
      description: json['Description'],
      picture: json['Picture'],
      uRL: json['URL'],
      categoryname: json['category_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Description'] = description;
    data['ID'] = ID;
    data['Name'] = name;
    data['Picture'] = picture;
    data['URL'] = uRL;
    data['category_name'] = categoryname;
    return data;
  }
}
