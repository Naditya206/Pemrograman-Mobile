Soal 2

Mengapa sangat penting untuk memahami bahasa pemrograman Dart sebelum kita menggunakan framework Flutter ? Jelaskan!

Jawaban
 1. Flutter Menggunakan Dart
Flutter ditulis dan didukung sepenuhnya oleh Dart. Seluruh kode yang kamu tulis di Flutter, mulai dari tata letak, logika aplikasi, hingga animasi, semuanya ditulis dalam bahasa Dart. Memahami sintaks, tipe data, dan konsep dasar Dart adalah langkah pertama untuk bisa menulis kode Flutter yang benar. 

 2. Konsep **Object-Oriented Programming (OOP)** Dart adalah bahasa yang berorientasi objek. Konsep-konsep seperti kelas (class), objek (object), pewarisan (inheritance), dan polimorfisme (polymorphism) sangat fundamental dalam Flutter. Setiap widget di Flutter pada dasarnya adalah sebuah kelas yang memiliki properti dan metode. Tanpa pemahaman yang kuat tentang OOP dalam Dart, akan sulit untuk memahami bagaimana widget-widget tersebut saling berinteraksi dan membentuk antarmuka pengguna. 

 3. Asynchronous Programming
Flutter sangat mengandalkan pemrograman asinkronus untuk menangani tugas-tugas yang memakan waktu lama, seperti mengambil data dari internet atau mengakses database. Dart memiliki fitur-fitur seperti `async` dan `await` yang mempermudah penanganan operasi-operasi ini tanpa membuat aplikasi macet. Jika kamu tidak memahami bagaimana Dart menangani **asynchronous programming**, aplikasi kamu akan sering **freeze** dan memberikan pengalaman buruk bagi pengguna.

 4. Efisiensi dan Performa
Flutter dikenal karena performanya yang cepat berkat fitur Hot Reload dan JIT (Just-in-Time) Compilation saat pengembangan, serta AOT (Ahead-of-Time) Compilation untuk produksi. Semua fitur ini dimungkinkan oleh desain bahasa Dart. Dengan memahami karakteristik Dart, kamu bisa menulis kode yang lebih efisien dan mengoptimalkan performa aplikasi Flutter kamu.

 5. Memahami Ekosistem dan Dokumentasi
Dokumentasi dan contoh kode resmi Flutter ditulis dalam bahasa Dart. Jika kamu tidak menguasai Dart, akan sulit untuk membaca, memahami, dan mengimplementasikan dokumentasi tersebut. Hampir semua paket dan pustaka pihak ketiga yang tersedia untuk Flutter juga ditulis dalam Dart, jadi pemahaman bahasa ini adalah kunci untuk memanfaatkan ekosistem Flutter secara maksimal.

Secara singkat, memahami Dart bukan hanya anjuran, melainkan prasyarat wajib untuk menjadi developer Flutter yang kompeten. Ini seperti mencoba membangun rumah tanpa mengerti cara menggunakan palu dan paku.


Soal 3

Rangkumlah materi dari codelab ini menjadi poin-poin penting yang dapat Anda gunakan untuk membantu proses pengembangan aplikasi mobile menggunakan framework Flutter.

Jawaban
Berikut adalah rangkuman poin-poin penting dari materi yang diberikan untuk membantu dalam pengembangan aplikasi mobile menggunakan Flutter:

1. Pentingnya Bahasa Dart untuk Flutter**
Fondasi Flutter: Flutter dibangun sepenuhnya di atas bahasa Dart. Semua kode, dari UI hingga logika, ditulis dalam Dart.
Productive Tooling:** Dart memiliki ekosistem tooling yang kaya, termasuk analisis kode, plugin IDE, dan manajemen paket yang mendukung produktivitas.
  Type Safety: Meskipun penulisan tipe data bersifat opsional, Dart aman karena memiliki fitur *type-safe* dan *type inference* yang membantu menemukan bug saat kompilasi.
  Portabilitas: Kode Dart sangat portabel; dapat dikompilasi ke JavaScript untuk web dan juga dikompilasi secara *native* ke kode ARM atau x86 untuk mobile dan desktop.

---

2. Evolusi Dart
Fokus Berubah:** Awalnya, Dart dikembangkan untuk menggantikan JavaScript di web, tetapi sekarang fokus utamanya adalah pada pengembangan aplikasi mobile, khususnya dengan Flutter.
  Modern dan Fleksibel: Dart dirancang untuk menjadi bahasa yang kuat dan fleksibel, menggabungkan fitur-fitur seperti *optional type annotations* dan konsep Object-Oriented Programming (OOP) untuk menciptakan keseimbangan antara fleksibilitas dan ketahanan.

---

3. Cara Kerja Dart
Dua Mode Eksekusi: Kode Dart dapat dieksekusi melalui dua cara utama: Dart Virtual Machines (VMs) dan JavaScript Compilations.
* **Kompilasi JIT (Just-In-Time):** Digunakan selama pengembangan. Mode ini mengkompilasi kode sesuai kebutuhan, memungkinkan fitur seperti **debugging** dan **Hot Reload** yang sangat mempercepat alur kerja pengembangan. 
* **Kompilasi AOT (Ahead-Of-Time):** Digunakan untuk rilis aplikasi di produksi. Mode ini mengkompilasi kode sebelum dijalankan, menghasilkan performa yang sangat optimal.

---

4. Struktur Dasar Bahasa Dart
Berorientasi Objek (OOP): Dart adalah bahasa berorientasi objek. Semua hal, termasuk tipe data dasar, adalah objek. Ini memungkinkan implementasi prinsip-prinsip OOP seperti *encapsulation*, *inheritance*, dan *polymorphism*. Operator: Operator di Dart (seperti `+`, `==`, `!`) pada dasarnya adalah metode yang didefinisikan dalam sebuah kelas. Ini memungkinkan *operator overloading*, di mana perilaku operator dapat bervariasi tergantung pada tipe data yang digunakan.

Soal 4

Buatlah penjelasan dan contoh eksekusi kode tentang perbedaan Null Safety dan Late variabel !

Kumpulkan jawaban Anda kepada dosen pengampu sesuai kesepakatan di kelas.
