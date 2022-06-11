class Pokemon {
  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.spriteUrl,
  });

  final String name;
  final String imageUrl;
  final String spriteUrl;
  final List<String> types;
  final int id;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json["id"],
      name: json['name'],
      imageUrl: json["sprites"]["other"]["official-artwork"]["front_default"],
      spriteUrl: json["sprites"]["front_default"],
      types: (json["types"] as List)
          .map((e) => e["type"]["name"].toString())
          .toList(),
    );
  }
}
