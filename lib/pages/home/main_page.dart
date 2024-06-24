import 'package:asisten_petani/pages/home/harvest_records_page.dart';
import 'package:asisten_petani/pages/home/category_page.dart';
import 'package:asisten_petani/pages/home/home_page.dart';
import 'package:asisten_petani/pages/home/about_page.dart';
import 'package:flutter/material.dart';
import 'package:asisten_petani/theme.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cameraButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/selectImage');
        },
        backgroundColor: buttonColor1,
        child: Icon(
          Icons.camera,
          size: 20,
          color: primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              30), // Sesuaikan angka sesuai dengan tingkat kebulatan yang Anda inginkan
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          elevation: 0, // Menghilangkan bayangan dari BottomAppBar
          child: BottomNavigationBar(
            backgroundColor: primaryColor,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: buttonColor1, // Atur warna item yang dipilih
            unselectedItemColor:
                Color(0xff2B2844), // Atur warna item yang tidak dipilih
            elevation: 0, // Menghilangkan bayangan dari BottomNavigationBar
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  child: Icon(Icons.home, size: 22),
                ),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  child: Icon(Icons.money, size: 22),
                ),
                label: 'Transaksi',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  child: Icon(Icons.list_alt, size: 22),
                ),
                label: 'Catatan',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  child: Icon(Icons.help, size: 22),
                ),
                label: 'Petunjuk',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return CategoryPage();
        case 2:
          return HarvestRecordsPage();
        case 3:
          return AboutPage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
        backgroundColor: backgroundColor2,
        floatingActionButton: cameraButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: customBottomNav(),
        body: body());
  }
}
