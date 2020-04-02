class Animal {
  String name;
  bool favorite;

  Animal(String name, [favorite]) {
    this.name = name;
    this.favorite = favorite ?? false;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'favorite': favorite,
      };
}
