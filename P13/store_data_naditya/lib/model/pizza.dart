class Pizza {
  final int? id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;
  final bool? isVeg;

  Pizza.fromJson(Map<String, dynamic> json)
      : id = json['id'] != null ? int.tryParse(json['id'].toString()) ?? 0 : null,
        // Langkah 10: Operator Ternary untuk null check
        pizzaName = json['pizzaName'] != null ? json['pizzaName'].toString() : 'No name',
        description = json['description'] != null ? json['description'].toString() : '',
        price = json['price'] != null 
            ? double.tryParse(json['price'].toString()) ?? 0.0 
            : 0.0,
        imageUrl = json['imageUrl'] != null ? json['imageUrl'].toString() : '',
        isVeg = json['isVeg'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isVeg': isVeg,
    };
  }
}