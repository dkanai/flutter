class Animal {
  String name;
  bool favorite;

  Animal(String name, [favorite]) {
    this.name = name;
    this.favorite = favorite ?? false;
  }

  String label() {
    if (favorite) {
      return name + " tapped!";
    }
    return name;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'favorite': favorite,
      };
}
