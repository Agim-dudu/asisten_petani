import 'package:flutter/material.dart';
import 'package:asisten_petani/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: buttonColor1,
        title: Text(
          'Tentang Aplikasi',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
      );
    }

    Widget viewDev() {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16), // Menambahkan jarak horizontal
          child: Column(
            children: [
              Container(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              'assets/nama.png', // Lokasi gambar Anda dalam proyek
                              width: 60,
                              height: 60,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "M. Gymnastiar",
                                style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    color: primaryColor,
                                    fontWeight: bold),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Software Developer",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    color: primaryColor,
                                    fontWeight: semiBold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16)),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              'assets/nama.png', // Lokasi gambar Anda dalam proyek
                              width: 60,
                              height: 60,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delphia Aryana",
                                style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    color: primaryColor,
                                    fontWeight: bold),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "UI / UX Designer",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    color: primaryColor,
                                    fontWeight: semiBold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16)),
              )
            ],
          ),
        ),
      );
    }

    Widget cardList() {
      return Container(
        padding: EdgeInsets.all(16),
        height: 460, // Atur tinggi kartu sesuai kebutuhan Anda
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Card(
              color: Colors.white, // Warna latar belakang kartu
              elevation: 0, // Efek shadow
              child: Container(
                padding: EdgeInsets.all(16),
                width: 300,
                child: Column(
                  children: [
                    Text(
                      'Aplikasi Asisten Petani',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Aplikasi ini adalah alat yang berguna bagi para petani padi untuk mengidentifikasi dan mengelola penyakit yang memengaruhi tanaman mereka. Dengan menggunakan teknologi deteksi gambar dan pencatatan keuangan yang canggih, aplikasi ini membantu meningkatkan hasil panen dan mengurangi kerugian akibat penyakit.',
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white, // Warna latar belakang kartu
              elevation: 0, // Efek shadow
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: 300, // Atur lebar kartu sesuai kebutuhan Anda
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  children: [
                    Text(
                      'Fitur Utama:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '1. Pengenalan Penyakit: Aplikasi ini dilengkapi dengan database penyakit padi yang umum terjadi, termasuk blast, hawar daun, karat daun, dan penyakit lainnya. Melalui penggunaan algoritma klasifikasi berbasis gambar, aplikasi dapat mengidentifikasi penyakit yang ada pada tanaman berdasarkan foto yang diunggah oleh pengguna.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '2. Deteksi Cepat: Proses deteksi penyakit dilakukan secara otomatis dalam waktu singkat. Setelah pengguna mengambil foto daun padi yang diduga terinfeksi, aplikasi akan segera menganalisis gambar tersebut dan memberikan hasil deteksi dalam hitungan detik.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '3. Rekomendasi Penanganan: Selain memberikan informasi tentang jenis penyakit yang terdeteksi, aplikasi ini juga memberikan saran tentang langkah-langkah penanganan yang tepat. Rekomendasi ini disusun berdasarkan basis pengetahuan tentang praktik pertanian yang baik dan efektif.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '4. Pencatatan Keuangan: Aplikasi ini memungkinkan pengguna untuk mencatat pengeluaran dan pendapatan terkait dengan usaha pertanian mereka. Dengan mencatat informasi keuangan seperti biaya pupuk, pestisida, dan hasil penjualan, petani dapat melakukan analisis biaya-manfaat yang lebih baik dan mengoptimalkan manajemen keuangan mereka.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),

                    Text(
                      '5. Ketersediaan Offline: Aplikasi ini dirancang untuk dapat berfungsi dalam kondisi offline, sehingga dapat diakses oleh petani di daerah pedesaan yang mungkin memiliki akses internet terbatas. Data dan algoritma deteksi penyakit disimpan secara lokal di perangkat pengguna.',
                      textAlign: TextAlign.justify,
                    ),
                    // Tambahkan item lainnya di sini
                  ],
                ),
              ),
            ),
            // Tambahkan kartu lainnya di sini sesuai kebutuhan
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      body: SingleChildScrollView(
        child: Column(
          children: [header(), viewDev(), cardList()],
        ),
      ),
    );
  }
}
