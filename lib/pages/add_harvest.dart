import 'package:flutter/material.dart';
import 'package:asisten_petani/theme.dart';
import 'package:intl/intl.dart';

class AddHarvest extends StatefulWidget {
  const AddHarvest({super.key});

  @override
  State<AddHarvest> createState() => _AddHarvestState();
}

class _AddHarvestState extends State<AddHarvest> {
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget formInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Jumlah',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                readOnly: true,
                controller: dateController,
                decoration: InputDecoration(
                  labelText: 'Tanggal',
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime
                        .now(), // Tambahkan nilai awal untuk initialDate
                    firstDate:
                        DateTime(2022), // Tambahkan firstDate jika diperlukan
                    lastDate:
                        DateTime(2100), // Tambahkan lastDate jika diperlukan
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-mm-dd').format(pickedDate);
                    setState(() {
                      dateController.text = formattedDate;
                    });
                    // Lakukan sesuatu dengan tanggal yang dipilih, misalnya, simpan di variabel atau lakukan operasi lainnya.
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60),
                    fixedSize: Size(200, 50),
                  ),
                  child: Text(
                    'Simpan',
                    style: TextStyle(color: backgroundColor1, fontSize: 16),
                  )))
        ],
      );
    }

    return Scaffold(
      extendBody: true,
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(
        backgroundColor: buttonColor1,
        title: Text(
          'Tambah Panen',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          formInput(),
        ],
      ),
    );
  }
}
