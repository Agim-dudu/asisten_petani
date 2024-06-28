import 'package:asisten_petani/pages/add_transaction.dart';
import 'package:asisten_petani/pages/select_image_page.dart';
import 'package:flutter/material.dart';
import 'package:asisten_petani/pages/welcome_page.dart';
import 'package:asisten_petani/pages/home/main_page.dart';
import 'package:asisten_petani/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/welcome': (context) => WelcomePage(),
        '/home': (context) => MainPage(),
        '/addTransaction': (context) => AddTransaction(
              transactionWithCategory: null,
            ),
        '/selectImage': (context) => SelectImage(),
        // '/index': (context) => Index(),
        // '/instruction': (context) => Instruction(),
        // '/about': (context) => About(),
      },
    );
  }
}
