import 'package:flutter/material.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000, photo: 'https://picsum.photos/200/300?random=1', stock: 15, rating: 4.5),
    Item(name: 'Salt', price: 2000, photo: 'https://picsum.photos/200/300?random=2', stock: 20, rating: 4.2),
    Item(name: 'Flour', price: 15000, photo: 'https://picsum.photos/200/300?random=3', stock: 10, rating: 4.8),
    Item(name: 'Rice', price: 12000, photo: 'https://picsum.photos/200/300?random=4', stock: 50, rating: 4.9),
    Item(name: 'Cooking Oil', price: 25000, photo: 'https://picsum.photos/200/300?random=5', stock: 30, rating: 4.6),
    Item(name: 'Eggs', price: 28000, photo: 'https://picsum.photos/200/300?random=6', stock: 100, rating: 4.7),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Perubahan di baris ini
        title: Text(
          "Marketplace",
          style: TextStyle(color: Colors.white), // Menambahkan style untuk warna teks
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Menampilkan 2 item per baris
          childAspectRatio: 0.75, // Mengatur rasio aspek item
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/item', arguments: item);
            },
            child: Card(
              elevation: 4,
              margin: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero widget untuk animasi gambar
                  Hero(
                    tag: 'product_image_${item.name}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                      child: Image.network(
                        item.photo,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Rp ${item.price}',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Stok: ${item.stock}', style: TextStyle(fontSize: 12)),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                Text(item.rating.toString(), style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Text(
            'Naditya Prastia Andino | 244107023008',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[700]),
          ),
        ),
      ),
    );
  }
}