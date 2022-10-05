class Food {
  Food({
    required this.name,
  });

  final String name;

  factory Food.fromMap(Map<String, dynamic> json) => Food(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
