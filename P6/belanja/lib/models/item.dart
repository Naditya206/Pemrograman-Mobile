class Item {
  String name;
  int price;
  String photo; // Tambahan atribut foto produk
  int stock;    // Tambahan atribut stok
  double rating;  // Tambahan atribut rating

  Item({
    required this.name,
    required this.price,
    required this.photo,
    required this.stock,
    required this.rating,
  });
}