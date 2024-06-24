import 'dart:io';
import 'package:flutter/material.dart';

class PlantPhotoView extends StatelessWidget {
  final File? file;
  const PlantPhotoView({Key? key, this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10), // Sudut sudut kotak
          border: Border.all(
            color: Color.fromARGB(255, 153, 153, 153), // Warna garis pinggir
            width: 3, // Lebar garis pinggir
          ),
        ),
        child: (file == null)
            ? _buildEmptyView()
            : Image.file(file!, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildEmptyView() {
    return Center(
      child: Icon(
        Icons.camera_alt, // Icon gambar kamera
        size: 150, // Ukuran ikon
        color: Color.fromARGB(255, 153, 153, 153), // Warna ikon
      ),
    );
  }
}
