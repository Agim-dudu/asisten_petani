import 'package:asisten_petani/models/database.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:asisten_petani/theme.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool switchValue = false;

  bool isExpense = true;
  int tipe = 2;
  final AppDb database = AppDb();
  TextEditingController categoryNameController = TextEditingController();

  Future insert(String nama, int tipe) async {
    DateTime now = DateTime.now();
    final sqll = await database.into(database.categories).insertReturning(
        CategoriesCompanion.insert(
            nama: nama, tipe: tipe, createdAt: now, updatedAt: now));

    print(sqll.toString());
  }

  Future<List<Category>> getAllCategory(int tipe) async {
    return await database.getAllCategoryRepo(tipe);
  }

  Future update(int categoryId, String newName) async {
    return await database.updateCategoryRepo(categoryId, newName);
  }

  void openDialog(Category? category) {
    if (category != null) {
      categoryNameController.text = category.nama;
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      (isExpense) ? "Tambah Pengeluaran" : "Tambah Pemasukan",
                      style: TextStyle(
                          color: (isExpense) ? Colors.red : Colors.green,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: categoryNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: isExpense ? "Pengeluaran" : "Pemasukan"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (category == null) {
                            insert(
                                categoryNameController.text, isExpense ? 2 : 1);
                          } else {
                            update(category.id, categoryNameController.text);
                          }
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');
                          setState(() {});
                          categoryNameController.clear();
                        },
                        child: Text("Simpan"))
                  ],
                ),
              ),
            ),
          );
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
                  value: isExpense,
                  onChanged: (bool value) {
                    setState(() {
                      isExpense = value;
                      tipe = value ? 2 : 1;
                    });
                  },
                  inactiveTrackColor: Colors.green[200],
                  inactiveThumbColor: Colors.green,
                  activeColor: Colors.red,
                ),
                IconButton(
                    onPressed: () {
                      openDialog(null);
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
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            FutureBuilder<List<Category>>(
                future: getAllCategory(tipe),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      if (snapshot.data!.length > 0) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Card(
                                  elevation: 10,
                                  child: ListTile(
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              database.deleteCategoryRepo(
                                                  snapshot.data![index].id);
                                              setState(() {});
                                            },
                                            icon: Icon(Icons.delete)),
                                        IconButton(
                                            onPressed: () {
                                              openDialog(snapshot.data![index]);
                                            },
                                            icon: Icon(Icons.edit)),
                                      ],
                                    ),
                                    title: Text(snapshot.data![index].nama),
                                    leading: (isExpense)
                                        ? Icon(Icons.upload, color: Colors.red)
                                        : Icon(Icons.download,
                                            color: Colors.green),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Center(
                          child: Text("No Has Data"),
                        );
                      }
                    } else {
                      return Center(
                        child: Text("No Has Data"),
                      );
                    }
                  }
                }),

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
