class JokesCategories {
  final List<String> categories;

  JokesCategories({required this.categories});

  factory JokesCategories.fromJson(List<dynamic> json) {
    return JokesCategories(
      categories: List<String>.from(json),
    );
  }

  List<dynamic> toJson() {
    List<dynamic> data = this.categories;
    return data;
  }
}
