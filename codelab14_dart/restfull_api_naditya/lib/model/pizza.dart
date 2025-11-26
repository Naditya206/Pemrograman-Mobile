class Pizza {
  int? id;
  String pizzaName;
  String description;
  double price;
  String imageUrl;

  // NEW fields
  String category;
  bool? isAvailable;
  double rating;

  // JSON keys
  static const String keyId = 'id';
  static const String keyPizzaName = 'pizzaName';
  static const String keyDescription = 'description';
  static const String keyPrice = 'price';
  static const String keyImageUrl = 'imageUrl';
  static const String keyCategory = 'category';
  static const String keyIsAvailable = 'isAvailable';
  static const String keyRating = 'rating';

  // Default constructor (needed for POST editable object)
  Pizza({
    this.id,
    this.pizzaName = '',
    this.description = '',
    this.price = 0.0,
    this.imageUrl = '',
    this.category = '',
    this.isAvailable,
    this.rating = 0.0,
  });

  // fromJson with safe parsing
  Pizza.fromJson(Map<String, dynamic> json)
      : id = json[keyId] != null ? int.tryParse(json[keyId].toString()) ?? 0 : null,
        pizzaName = json[keyPizzaName]?.toString() ?? '',
        description = json[keyDescription]?.toString() ?? '',
        price = json[keyPrice] != null
            ? (json[keyPrice] is double
                ? json[keyPrice] as double
                : double.tryParse(json[keyPrice].toString()) ?? 0.0)
            : 0.0,
        imageUrl = json[keyImageUrl]?.toString() ?? '',
        category = json[keyCategory]?.toString() ?? '',
        isAvailable = json[keyIsAvailable] is bool ? json[keyIsAvailable] as bool : (json[keyIsAvailable] != null ? (json[keyIsAvailable].toString().toLowerCase() == 'true') : null),
        rating = json[keyRating] != null
            ? (json[keyRating] is double
                ? json[keyRating] as double
                : double.tryParse(json[keyRating].toString()) ?? 0.0)
            : 0.0;

  // toJson includes new fields
  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyPizzaName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImageUrl: imageUrl,
      keyCategory: category,
      keyIsAvailable: isAvailable,
      keyRating: rating,
    };
  }
}
