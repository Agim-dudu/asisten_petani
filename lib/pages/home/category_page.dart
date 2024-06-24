import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart'; // Import package calendar_appbar
import 'package:asisten_petani/theme.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool switchValue = false;
  void openDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: SingleChildScrollView(
            child: Center(
                child: Column(
              children: [
                Text(
                  (switchValue) ? 'Tambah Pengeluaran' : "Tambah Pemasukan",
                  style: TextStyle(
                      fontSize: 20,
                      color: (switchValue) ? Colors.red : Colors.green),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'nama',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60),
                      fixedSize: Size(200, 50),
                    ),
                    child: Text('Simpan',
                        style:
                            TextStyle(color: backgroundColor1, fontSize: 16)))
              ],
            )),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget switchButton() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Switch(
                  value: switchValue,
                  onChanged: (bool value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                  activeTrackColor: Colors
                      .red, // Mengubah warna latar belakang tombol saat digeser ke merah
                  inactiveTrackColor: Colors
                      .green, // Mengubah warna latar belakang tombol saat tidak digeser ke hijau
                ),
                IconButton(
                    onPressed: () {
                      openDialog();
                    },
                    icon: Icon(Icons.add))
              ],
            ),
          ],
        ),
      );
    }

    Widget shapeList() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Card(
              elevation: 1,
              color: Colors.white,
              child: ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    SizedBox(width: 10),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                  ],
                ),
                title: Text("Jual Padi"),
                leading: switchValue
                    ? Icon(
                        Icons.upload,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.upload,
                        color: Colors.green,
                      ),
              ),
            ),
            SizedBox(height: 5), // Berikan jarak antar transaksi
            Card(
              elevation: 1,
              color: Colors.white,
              child: ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    SizedBox(width: 10),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                  ],
                ),
                title: Text("Jual Beras"),
                leading: switchValue
                    ? Icon(
                        Icons.upload,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.upload,
                        color: Colors.green,
                      ),
              ),
            ),
            SizedBox(
                height:
                    5), // Berikan jarak antar transaksi // Berikan jarak antar transaksi
            Card(
              elevation: 1,
              color: Colors.white,
              child: ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    SizedBox(width: 10),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                  ],
                ),
                title: Text("Jual Pupuk"),
                leading: switchValue
                    ? Icon(
                        Icons.upload,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.upload,
                        color: Colors.green,
                      ),
              ),
            ),
            SizedBox(height: 5), // Berikan jarak antar transaksi
            Card(
              elevation: 1,
              color: Colors.white,
              child: ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    SizedBox(width: 10),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                  ],
                ),
                title: Text("Jual Benih"),
                leading: switchValue
                    ? Icon(
                        Icons.upload,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.upload,
                        color: Colors.green,
                      ),
              ),
            ),
            SizedBox(height: 5), // Berikan jarak antar transaksi
          ],
        ),
      );
    }

    return Scaffold(
      extendBody: true,
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      appBar: CalendarAppBar(
        backButton: false,
        accent: buttonColor1,
        locale: 'id', // Gunakan nilai buttonColor1 langsung
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
      ),
      body: ListView(
        children: <Widget>[switchButton(), shapeList()],
      ),
    );
  }
}
