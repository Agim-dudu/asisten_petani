import 'package:flutter/material.dart';
import 'package:asisten_petani/theme.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  bool switchValue = false;
  List<String> list = ['jual Padi', 'Beli Pupuk'];
  late String selectedValue = list.first;
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget switchButton() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Row(
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
                SizedBox(
                  width: 10,
                ),
                Text(switchValue ? 'Pengeluaran' : 'Pemasukan',
                    style: TextStyle(color: backgroundColor1, fontSize: 16)),
              ],
            ),
          ],
        ),
      );
    }

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
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text('Kategori'),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButton<String>(
                value: selectedValue,
                isExpanded: true,
                icon: Icon(Icons.arrow_downward),
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
                items: list.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
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
          'Transaksi Baru',
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
          switchButton(),
          formInput(),
        ],
      ),
    );
  }
}
