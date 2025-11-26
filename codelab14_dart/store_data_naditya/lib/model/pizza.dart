class Pizza {
  int? id;                 // Bisa diedit → bukan final
  String pizzaName;
  String description;
  double price;
  String imageUrl;
  bool? isVeg;

  // Konstanta key JSON
  static const String keyId = 'id';
  static const String keyPizzaName = 'pizzaName';
  static const String keyDescription = 'description';
  static const String keyPrice = 'price';
  static const String keyImageUrl = 'imageUrl';
  static const String keyIsVeg = 'isVeg';

  // 🔥 Constructor default → diperlukan untuk POST
  Pizza({
    this.id,
    this.pizzaName = '',
    this.description = '',
    this.price = 0.0,
    this.imageUrl = '',
    this.isVeg,
  });

  // Constructor dari JSON
  Pizza.fromJson(Map<String, dynamic> json)
      : id = json[keyId] != null
            ? int.tryParse(json[keyId].toString()) ?? 0
            : null,
        pizzaName = json[keyPizzaName]?.toString() ?? 'No name',
        description = json[keyDescription]?.toString() ?? '',
        price = json[keyPrice] != null
            ? (json[keyPrice] is double
                ? json[keyPrice]
                : double.tryParse(json[keyPrice].toString()) ?? 0.0)
            : 0.0,
        imageUrl = json[keyImageUrl]?.toString() ?? '',
        isVeg = json[keyIsVeg];

  // Convert ke JSON
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
