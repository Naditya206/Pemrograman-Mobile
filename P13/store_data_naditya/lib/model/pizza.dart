class Pizza {
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza.fromJson(Map<String, dynamic> json)
      : pizzaName = json['pizzaName'],
        description = json['description'],
        price = json['price'].toDouble(),
        imageUrl = json['imageUrl'];
}
