class JokeResponse {
  List<String> categories;
  String createdAt;
  String iconUrl;
  String id;
  String updatedAt;
  String url;
  String value;

  JokeResponse(
      {required this.categories,
      required this.createdAt,
      required this.iconUrl,
      required this.id,
      required this.updatedAt,
      required this.url,
      required this.value});

  factory JokeResponse.fromJson(Map<String, dynamic> json) {
    return JokeResponse(
      categories: json['categories'].cast<String>(),
      createdAt: json['created_at'],
      iconUrl: json['icon_url'],
      id: json['id'],
      updatedAt: json['updated_at'],
      url: json['url'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories'] = this.categories;
    data['created_at'] = this.createdAt;
    data['icon_url'] = this.iconUrl;
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['url'] = this.url;
    data['value'] = this.value;
    return data;
  }
}
