import 'package:asisten_petani/theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _redirectToOnboarding(); // Panggil metode untuk mengarahkan ke halaman onboarding
  }

  // Metode untuk mengarahkan ke halaman onboarding setelah beberapa detik
  void _redirectToOnboarding() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor7,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
            SizedBox(height: 20), // Mengubah jarak menjadi 20 untuk estetika
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 234, 160, 12)),
              ),
            ), // Loading di bawah gambar
          ],
        ),
      ),
    );
  }
}
