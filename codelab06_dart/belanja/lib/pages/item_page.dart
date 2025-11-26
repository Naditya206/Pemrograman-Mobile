import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil argumen yang dikirim dari halaman sebelumnya
    final item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        // Menambahkan style untuk mengubah warna teks judul
        title: Text(
          item.name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        // Menambahkan ini agar ikon (seperti panah kembali) juga berwarna putih
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero widget harus memiliki tag yang sama dengan di halaman sebelumnya
            Hero(
              tag: 'product_image_${item.name}',
              child: Image.network(
                item.photo,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                 // Menambahkan error builder jika gambar gagal dimuat
                errorBuilder: (context, error, stackTrace) {
                   return Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Icon(Icons.broken_image, color: Colors.grey, size: 50),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rp ${item.price}',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Stok Tersedia: ${item.stock} buah',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          SizedBox(width: 4),
                          Text(
                            item.rating.toString(),
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  SizedBox(height: 10),
                  Text(
                    'Deskripsi Produk',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Ini adalah deskripsi untuk ${item.name}. Produk ini memiliki kualitas terbaik dengan rating ${item.rating} dari pelanggan kami. Segera beli sebelum kehabisan, stok terbatas!',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi untuk menambahkan ke keranjang
        },
        child: Icon(Icons.add_shopping_cart, color: Colors.white),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
