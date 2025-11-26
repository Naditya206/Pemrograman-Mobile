class Pizza {
  final int? id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;
  final bool? isVeg;

  // Langkah 1: Buat konstanta untuk nilai default
  static const String keyId = 'id';
  static const String keyPizzaName = 'pizzaName';
  static const String keyDescription = 'description';
  static const String keyPrice = 'price';
  static const String keyImageUrl = 'imageUrl';
  static const String keyIsVeg = 'isVeg';

  // Langkah 2: Perbarui fromJson() menggunakan Konstanta
  Pizza.fromJson(Map<String, dynamic> json)
      : id = json[keyId] != null ? int.tryParse(json[keyId].toString()) ?? 0 : null,
        // Langkah 10: Operator Ternary untuk null check
        pizzaName = json[keyPizzaName] != null 
            ? json[keyPizzaName].toString() 
            : 'No name',
        description = json[keyDescription] != null 
            ? json[keyDescription].toString() 
            : '',
        price = json[keyPrice] != null 
            ? double.tryParse(json[keyPrice].toString()) ?? 0.0 
            : 0.0,
        imageUrl = json[keyImageUrl] != null 
            ? json[keyImageUrl].toString() 
            : '',
        isVeg = json[keyIsVeg];

  // Langkah 3: Perbarui toJson() menggunakan Konstanta
  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyPizzaName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImageUrl: imageUrl,
      keyIsVeg: isVeg,
    };
  }
}