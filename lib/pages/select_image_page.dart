import 'dart:io';
import 'package:asisten_petani/theme.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import '../classifier/classifier.dart';
import 'package:asisten_petani/pages/diagnosa.dart'; // import halaman Diagnosis
import 'package:asisten_petani/pages/plant_photo_view.dart'; // import halaman Diagnosis
import 'enums.dart'; // import the enums file

const _labelsFileName = 'assets/labels.txt';
const _modelFileName = 'model_unquant.tflite';

class SelectImage extends StatefulWidget {
  const SelectImage({Key? key}) : super(key: key);

  @override
  State<SelectImage> createState() => _IndexState();
}

class _IndexState extends State<SelectImage> {
  bool _isAnalyzing = false;
  final picker = ImagePicker();
  File? _selectedImageFile;

  // Result
  ResultStatus _resultStatus = ResultStatus.notStarted;
  String _plantLabel = '';
  double _accuracy = 0.0;

  Classifier? _classifier;

  @override
  void initState() {
    super.initState();
    _loadClassifier();
  }

  Future<void> _loadClassifier() async {
    debugPrint(
      'Start loading of Classifier with '
      'labels at $_labelsFileName, '
      'model at $_modelFileName',
    );

    final classifier = await Classifier.loadWith(
      labelsFileName: _labelsFileName,
      modelFileName: _modelFileName,
    );

    if (classifier != null) {
      setState(() {
        _classifier = classifier;
      });
    } else {
      print('Failed to load classifier');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttonColor1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Mulai Deteksi',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/slide1.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
          ),
        ),
        padding: EdgeInsets.only(top: 40),
        child: Center(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              _buildPhotolView(),
              SizedBox(height: 10),
              _buildTitle(),
              // SizedBox(height: 10),
              // _buildResultView(),
              SizedBox(height: 10),
              _buildPickPhotoButton(
                title: 'Ambil Gambar',
                source: ImageSource.camera,
              ),
              _buildPickGalleryButton(
                title: 'Ambil dari Galeri',
                source: ImageSource.gallery,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotolView() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        PlantPhotoView(file: _selectedImageFile),
        _buildAnalyzingText(),
      ],
    );
  }

  Widget _buildAnalyzingText() {
    if (!_isAnalyzing) {
      return const SizedBox.shrink();
    }
    return const Text('Analyzing...', style: TextStyle());
  }

  Widget _buildTitle() {
    return const Text(
      'Masukkan Gambar',
      style: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 25,
      ),
    );
  }

  Widget _buildPickPhotoButton({
    required String title,
    required ImageSource source,
  }) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.only(top: 20, right: 20, left: 20),
      child: ElevatedButton.icon(
        onPressed: () => _onPickPhoto(source),
        icon: Icon(
          Icons.camera_alt,
          color: buttonColor1,
        ),
        label: Text(
          title,
          style: TextStyle(
            color: buttonColor1,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildPickGalleryButton({
    required String title,
    required ImageSource source,
  }) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.only(top: 20, right: 20, left: 20),
      child: ElevatedButton.icon(
        onPressed: () => _onPickPhoto(source),
        icon: Icon(
          Icons.image,
          color: buttonColor1,
        ),
        label: Text(
          title,
          style: TextStyle(
            color: buttonColor1,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  void _setAnalyzing(bool flag) {
    setState(() {
      _isAnalyzing = flag;
    });
  }

  void _onPickPhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile == null) {
      return;
    }

    final imageFile = File(pickedFile.path);
    setState(() {
      _selectedImageFile = imageFile;
    });

    _analyzeImage(imageFile);
  }

  void _analyzeImage(File image) {
    _setAnalyzing(true);

    final imageInput = img.decodeImage(image.readAsBytesSync())!;

    if (_classifier != null) {
      final resultCategory = _classifier!.predict(imageInput);

      final result = resultCategory.score >= 0.6
          ? ResultStatus.found
          : ResultStatus.notFound;
      final plantLabel = resultCategory.label;
      final accuracy = resultCategory.score;

      _setAnalyzing(false);

      setState(() {
        _resultStatus = result;
        _plantLabel = plantLabel;
        _accuracy = accuracy;
      });

      if (_resultStatus == ResultStatus.found) {
        // Pindah ke halaman diagnosa jika hasil ditemukan
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Diagnosa(
              imageFile: image,
              resultStatus: _resultStatus,
              plantLabel: _plantLabel,
              accuracy: _accuracy,
            ),
          ),
        );
      } else if (_resultStatus == ResultStatus.notFound) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: primaryColor,
              title: Text(
                'Gagal Mendeteksi Gambar',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/fail.png', width: 100, height: 100),
                  SizedBox(height: 10),
                  Text(
                    'Yah sistem tidak dapat mendeteksi gambar....',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: backgroundColor1, fontSize: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK',
                            style: TextStyle(color: backgroundColor1)),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      }
    } else {
      // Handle case when classifier is null
      print('Classifier is null');
      _setAnalyzing(false);
    }
  }

  // Widget _buildResultView() {
  //   var title = '';

  //   if (_resultStatus == ResultStatus.notFound) {
  //     title = 'Fail to recognise';
  //   } else if (_resultStatus == ResultStatus.found) {
  //     title = _plantLabel;
  //   } else {
  //     title = 'gambar tidak dikenali';
  //   }

  //   var accuracyLabel = '';
  //   if (_resultStatus == ResultStatus.found) {
  //     accuracyLabel =
  //         'Tingkat Keyakinan : ${(_accuracy * 100).toStringAsFixed(2)}%';
  //   }

  // return Column(
  //   children: [
  //     Text(title, style: TextStyle()),
  //     const SizedBox(height: 10),
  //     Text(accuracyLabel, style: TextStyle()),
  //   ],
  // );
  // }
}
