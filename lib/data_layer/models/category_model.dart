class Category {
  final String name;

  Category({required this.name});

//This is a factory sol to create a list of categories as models
  factory Category.fromJson(String name) {
    return Category(
      name: name,
    );
  }


}
