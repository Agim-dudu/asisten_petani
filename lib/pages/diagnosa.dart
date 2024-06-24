import 'dart:io';
import 'package:asisten_petani/theme.dart';
import 'package:flutter/material.dart';
import 'enums.dart'; // import the enums file

class Diagnosa extends StatelessWidget {
  final File imageFile;
  final ResultStatus resultStatus;
  final String plantLabel;
  final double accuracy;

  Diagnosa({
    required this.imageFile,
    required this.resultStatus,
    required this.plantLabel,
    required this.accuracy,
  });

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: buttonColor1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Diagnosa',
          style: TextStyle(
            color: primaryColor,
            fontSize: 20,
          ),
        ),
      );
    }

    Widget _buildImageWithBorder() {
      return Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Atur border radius
          border: Border.all(
            color: Colors.grey, // Warna border
            width: 4, // Lebar border
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8), // Atur clipRRect border
          child: Image.file(
            imageFile,
            width: 300,
            height: 300,
            fit: BoxFit.cover, // Sesuaikan dengan ukuran widget
          ),
        ),
      );
    }

    Widget viewDiagnos() {
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
                            child: Icon(
                              Icons.medical_services,
                              color: Colors.green,
                              size: 44,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Diagnosa :",
                                style: TextStyle(
                                    color: backgroundColor1,
                                    fontSize:
                                        16), // Perhatikan perubahan di sini
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                "$plantLabel",
                                style: TextStyle(
                                    color: backgroundColor1, fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 44,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Keyakinan :",
                                style: TextStyle(
                                    color: backgroundColor1,
                                    fontSize:
                                        16), // Perhatikan perubahan di sini
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                "${(accuracy * 100).toStringAsFixed(2)}%",
                                style: TextStyle(
                                    color: backgroundColor1, fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
              )
            ],
          ),
        ),
      );
    }

    Widget buttonList(String plantLabel) {
      if (plantLabel == 'Bacterialblight') {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Action when the first button is pressed
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  fixedSize: Size(200, 50),
                ),
                child: Text(
                  'Penjelasan',
                  style: TextStyle(color: backgroundColor1, fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action when the second button is pressed
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  fixedSize: Size(200, 50),
                ),
                child: Text(
                  'Penanganan',
                  style: TextStyle(color: backgroundColor1, fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action when the third button is pressed
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  fixedSize: Size(200, 50),
                ),
                child: Text(
                  'Pencegahan',
                  style: TextStyle(color: backgroundColor1, fontSize: 16),
                ),
              ),
            ],
          ),
        );
      } else if (plantLabel == 'Blast') {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Action when the first button is pressed
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  fixedSize: Size(200, 50),
                ),
                child: Text(
                  'Penjelasan,',
                  style: TextStyle(color: backgroundColor1, fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action when the second button is pressed
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  fixedSize: Size(200, 50),
                ),
                child: Text(
                  'Penanganan',
                  style: TextStyle(color: backgroundColor1, fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action when the third button is pressed
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  fixedSize: Size(200, 50),
                ),
                child: Text(
                  'Pencegahan',
                  style: TextStyle(color: backgroundColor1, fontSize: 16),
                ),
              ),
            ],
          ),
        );
      } else if (plantLabel == 'Brownspot') {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Action when the first button is pressed
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  fixedSize: Size(200, 50),
                ),
                child: Text(
                  'Penjelasan',
                  style: TextStyle(color: backgroundColor1, fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action when the second button is pressed
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  fixedSize: Size(200, 50),
                ),
                child: Text(
                  'Penanganan',
                  style: TextStyle(color: backgroundColor1, fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action when the third button is pressed
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  fixedSize: Size(200, 50),
                ),
                child: Text(
                  'Pencegahan',
                  style: TextStyle(color: backgroundColor1, fontSize: 16),
                ),
              ),
            ],
          ),
        );
      } else {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Action when the first button is pressed
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  fixedSize: Size(200, 50),
                ),
                child: Text(
                  'Penjelasan',
                  style: TextStyle(color: backgroundColor1, fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action when the second button is pressed
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  fixedSize: Size(200, 50),
                ),
                child: Text(
                  'Penanganan',
                  style: TextStyle(color: backgroundColor1, fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action when the third button is pressed
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  fixedSize: Size(200, 50),
                ),
                child: Text(
                  'Pencegahan',
                  style: TextStyle(color: backgroundColor1, fontSize: 16),
                ),
              ),
            ],
          ),
        );
      }
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/slide2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            header(),
            SizedBox(
              height: 20,
            ),
            _buildImageWithBorder(),
            viewDiagnos(),
            SizedBox(
              height: 20,
            ),
            buttonList(plantLabel)
          ],
        ),
      ),
    );

    //   return Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: buttonColor1,
    //       leading: IconButton(
    //         icon: Icon(Icons.arrow_back, color: Colors.white),
    //         onPressed: () {
    //           Navigator.pop(context);
    //         },
    //       ),
    //       title: Text(
    //         'Hasil Diagnosa',
    //         style: TextStyle(
    //           color: primaryColor,
    //           fontSize: 20,
    //         ),
    //       ),
    //     ),
    //     body: Center(
    //       child: Column(
    //         children: [
    //           SizedBox(height: 40), // Jarak 20 px di atas gambar
    //           _buildImageWithBorder(),
    //           SizedBox(height: 20),
    //           Text('Hasil prediksi: $plantLabel',
    //               style: TextStyle(
    //                 color: Color.fromARGB(255, 0, 0, 0),
    //                 fontSize: 25,
    //                 fontWeight: FontWeight.bold,
    //                 fontFamily: 'Roboto',
    //               )),
    //           SizedBox(height: 10),
    //           Text('Tingkat keyakinan: ${(accuracy * 100).toStringAsFixed(2)}%',
    //               style: TextStyle(
    //                 color: Color.fromARGB(255, 0, 0, 0),
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.bold,
    //                 fontFamily: 'Roboto',
    //               )),
    //           SizedBox(height: 20), // Tambahkan spasi antara elemen
    //           // Tombol "Mulai Deteksi"
    //           Container(
    //             width: double.infinity,
    //             height: 60,
    //             margin: EdgeInsets.only(top: 20, right: 20, left: 20),
    //             child: ElevatedButton.icon(
    //               onPressed: () {
    //                 Navigator.pushNamed(context, '/index');
    //               },
    //               icon: Icon(
    //                 Icons.lightbulb,
    //                 color: Color.fromARGB(255, 255, 255, 255),
    //               ),
    //               label: Text(
    //                 'Penjelasan Penyakit',
    //                 style: TextStyle(
    //                   color: Color.fromARGB(255, 255, 255, 255),
    //                   fontSize: 16,
    //                   fontWeight: FontWeight.bold,
    //                   fontFamily: 'Roboto',
    //                 ),
    //               ),
    //               style: ElevatedButton.styleFrom(
    //                 primary: Color.fromARGB(255, 234, 160, 12),
    //               ),
    //             ),
    //           ),

    //           Container(
    //             width: double.infinity,
    //             height: 60,
    //             margin: EdgeInsets.only(top: 20, right: 20, left: 20),
    //             child: ElevatedButton.icon(
    //                 onPressed: () {
    //                   Navigator.pushNamed(context, '/index');
    //                 },
    //                 icon: Icon(
    //                   Icons.health_and_safety,
    //                   color: Color.fromARGB(255, 255, 255, 255),
    //                 ),
    //                 label: Text(
    //                   'Penanganan & Pengobatan',
    //                   style: TextStyle(
    //                     color: Color.fromARGB(255, 255, 255, 255),
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.bold,
    //                     fontFamily: 'Roboto',
    //                   ),
    //                 ),
    //                 style: ElevatedButton.styleFrom(
    //                   primary: Color.fromARGB(255, 234, 160, 12),
    //                 )),
    //           ),
    //           Container(
    //             width: double.infinity,
    //             height: 60,
    //             margin: EdgeInsets.only(top: 20, right: 20, left: 20),
    //             child: ElevatedButton.icon(
    //               onPressed: () {
    //                 Navigator.pushNamed(context, '/index');
    //               },
    //               icon: Icon(
    //                 Icons.warning,
    //                 color: Color.fromARGB(255, 255, 255, 255),
    //               ),
    //               label: Text(
    //                 'Pencegahan',
    //                 style: TextStyle(
    //                   color: Color.fromARGB(255, 255, 255, 255),
    //                   fontSize: 16,
    //                   fontWeight: FontWeight.bold,
    //                   fontFamily: 'Roboto',
    //                 ),
    //               ),
    //               style: ElevatedButton.styleFrom(
    //                 primary: Color.fromARGB(255, 234, 160, 12),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    // // Widget _buildPeridct() {
    // //   return const Text(
    // //     'Diagnosa : ',
    // //     style: TextStyle(
    // //       color: Color.fromARGB(255, 255, 255, 255),
    // //       fontSize: 25,
    // //       fontWeight: FontWeight.bold,
    // //       fontFamily: 'Roboto',
    // //     ),
    // //   );
    // // }

    // // Widget _buildConfidence() {
    // //   return const Text(
    // //     'Tingkat Keyakinan :',
    // //     style: TextStyle(
    // //       color: Color.fromARGB(255, 255, 255, 255),
    // //       fontSize: 25,
    // //       fontWeight: FontWeight.bold,
    // //       fontFamily: 'Roboto',
    // //     ),
    // //   );
    // // }

    // Widget _buildImageWithBorder() {
    //   return Container(
    //     width: 300,
    //     height: 300,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10), // Atur border radius
    //       border: Border.all(
    //         color: Colors.black, // Warna border
    //         width: 2, // Lebar border
    //       ),
    //     ),
    //     child: ClipRRect(
    //       borderRadius: BorderRadius.circular(8), // Atur clipRRect border
    //       child: Image.file(
    //         imageFile,
    //         width: 300,
    //         height: 300,
    //         fit: BoxFit.cover, // Sesuaikan dengan ukuran widget
    //       ),
    //     ),
    //   );
  }
}
