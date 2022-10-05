class Drink {
  Drink({
    required this.name,
  });

  final String name;

  factory Drink.fromMap(Map<String, dynamic> json) => Drink(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
