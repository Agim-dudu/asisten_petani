import 'package:asisten_petani/models/database.dart';
import 'package:asisten_petani/models/transaction_with_category.dart';
import 'package:flutter/material.dart';
import 'package:asisten_petani/theme.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final TransactionWithCategory? transactionWithCategory;
  const AddTransaction({Key? key, required this.transactionWithCategory})
      : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  bool isExpense = true;
  late int type;
  final AppDb database = AppDb();
  Category? selectedCategory;
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();

// INSERT DATA
  Future insert(int jumlah, DateTime date, int categoryId) async {
    DateTime now = DateTime.now();
    final row = await database.into(database.transactions).insertReturning(
        TransactionsCompanion.insert(
            category_id: categoryId,
            jumlah: jumlah,
            transaction_date: date,
            createdAt: now,
            updatedAt: now));

    print("Masuk : " + row.toString());
  }

  Future<List<Category>> getAllCategory(int tipe) async {
    return await database.getAllCategoryRepo(tipe);
  }

  Future update(
    int transactionId,
    int categoryId,
    DateTime transactionDate,
    int jumlah,
  ) async {
    final row = await database.updateTransactionRepo(
        transactionId, categoryId, transactionDate, jumlah);
    print("Update >>>> " + row.toString());
    return row;
  }

  @override
  void initState() {
    // TODO: implement initState
    if (widget.transactionWithCategory != null) {
      updateTransactionView(widget.transactionWithCategory!);
    } else {
      type = 2;
    }
    super.initState();
  }

  void updateTransactionView(TransactionWithCategory transactionWithCategory) {
    amountController.text =
        transactionWithCategory.transaction.jumlah.toString();
    dateController.text = DateFormat("yyyy-MM-dd")
        .format(transactionWithCategory.transaction.transaction_date);
    type = transactionWithCategory.category.tipe;
    (type == 2) ? isExpense = true : isExpense = false;
    selectedCategory = transactionWithCategory.category;
  }

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
                  value: isExpense,
                  onChanged: (bool value) {
                    setState(() {
                      isExpense = value;
                      type = (isExpense) ? 2 : 1;
                      selectedCategory = null;
                    });
                  },
                  inactiveTrackColor: Colors.green[200],
                  inactiveThumbColor: Colors.green,
                  activeColor: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(isExpense ? 'Pengeluaran' : 'Pemasukan',
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
                controller: amountController,
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
          FutureBuilder<List<Category>>(
              future: getAllCategory(type),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    if (snapshot.data!.length > 0) {
                      // selectedCategory = snapshot.data!.first;
                      print("Apanih : " + snapshot.data!.first.toString());
                      return SafeArea(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: DropdownButton<Category>(
                              value: (selectedCategory == null)
                                  ? snapshot.data!.first
                                  : selectedCategory,
                              isExpanded: true,
                              icon: Icon(Icons.arrow_downward),
                              onChanged: (Category? value) {
                                setState(() {
                                  selectedCategory = value;
                                });
                              },
                              items: snapshot.data!.map((Category value) {
                                return DropdownMenuItem<Category>(
                                  value: value,
                                  child: Text(value.nama),
                                );
                              }).toList(),
                            )),
                      );
                    } else {
                      return Center(
                        child: Text("Data Kosong"),
                      );
                    }
                  } else {
                    return Center(
                      child: Text("Tidak ada data"),
                    );
                  }
                }
              }),
          SizedBox(
            height: 10,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
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
                        DateFormat('yyyy-MM-dd').format(pickedDate);
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
                  onPressed: () async {
                    (widget.transactionWithCategory == null)
                        ? insert(
                            int.parse(amountController.text),
                            DateTime.parse(dateController.text),
                            selectedCategory!.id)
                        : await update(
                            widget.transactionWithCategory!.transaction.id,
                            selectedCategory!.id,
                            DateTime.parse(dateController.text),
                            int.parse(amountController.text));
                    setState(() {});
                    Navigator.pop(context, true);
                  },
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
