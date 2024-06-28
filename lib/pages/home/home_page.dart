import 'package:asisten_petani/models/database.dart';
import 'package:asisten_petani/models/transaction_with_category.dart';
import 'package:asisten_petani/theme.dart';
import 'package:flutter/material.dart';
import 'package:asisten_petani/pages/add_transaction.dart';
import 'package:calendar_appbar/calendar_appbar.dart'; // Import package calendar_appbar
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final DateTime selectedDate;
  const HomePage({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppDb database = AppDb();
  late DateTime selectedDate;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    updateView(0, DateTime.now());
    super.initState();
  }

  void updateView(int index, DateTime? date) {
    setState(() {
      if (date != null) {
        selectedDate = DateTime.parse(DateFormat('yyyy-MM-dd').format(date));
      }

      currentIndex = index;
      // _children = [
      //   HomePage(
      //     selectedDate: selectedDate,
      //   ),
      //   CategoryPage()
      // ];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget barChart() {
      return Container(
        margin: EdgeInsets.all(16),
        width: 400, // Atur lebar grafik
        height: 300, // Atur tinggi grafik
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(12), // Atur radius sudut
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 16, right: 10),
          child: BarChart(
            BarChartData(
              barGroups: [
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(y: 3000000, colors: [Colors.green]),
                    BarChartRodData(y: 2500000, colors: [Colors.red]),
                  ],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(y: 3000000, colors: [Colors.green]),
                    BarChartRodData(y: 2500000, colors: [Colors.red]),
                  ],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(y: 3000000, colors: [Colors.green]),
                    BarChartRodData(y: 2500000, colors: [Colors.red]),
                  ],
                ),
                BarChartGroupData(
                  x: 4,
                  barRods: [
                    BarChartRodData(y: 2000000, colors: [Colors.green]),
                    BarChartRodData(y: 1500000, colors: [Colors.red]),
                  ],
                ),
                BarChartGroupData(
                  x: 5,
                  barRods: [
                    BarChartRodData(y: 4000000, colors: [Colors.green]),
                    BarChartRodData(y: 3000000, colors: [Colors.red]),
                  ],
                ),
                BarChartGroupData(
                  x: 6,
                  barRods: [
                    BarChartRodData(y: 2600000, colors: [Colors.green]),
                    BarChartRodData(y: 2300000, colors: [Colors.red]),
                  ],
                ),
                BarChartGroupData(
                  x: 7,
                  barRods: [
                    BarChartRodData(y: 2600000, colors: [Colors.green]),
                    BarChartRodData(y: 2300000, colors: [Colors.red]),
                  ],
                ),
                BarChartGroupData(
                  x: 8,
                  barRods: [
                    BarChartRodData(y: 2600000, colors: [Colors.green]),
                    BarChartRodData(y: 2300000, colors: [Colors.red]),
                  ],
                ),
                BarChartGroupData(
                  x: 9,
                  barRods: [
                    BarChartRodData(y: 2600000, colors: [Colors.green]),
                    BarChartRodData(y: 2300000, colors: [Colors.red]),
                  ],
                ),
                BarChartGroupData(
                  x: 10,
                  barRods: [
                    BarChartRodData(y: 2600000, colors: [Colors.green]),
                    BarChartRodData(y: 2300000, colors: [Colors.red]),
                  ],
                ),
                BarChartGroupData(
                  x: 11,
                  barRods: [
                    BarChartRodData(y: 2600000, colors: [Colors.green]),
                    BarChartRodData(y: 2300000, colors: [Colors.red]),
                  ],
                ),
                BarChartGroupData(
                  x: 12,
                  barRods: [
                    BarChartRodData(y: 2600000, colors: [Colors.green]),
                    BarChartRodData(y: 2300000, colors: [Colors.red]),
                  ],
                ),
                // Tambahkan data bar chart yang lain di sini
              ],
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.black, width: 1),
              ),
              titlesData: FlTitlesData(
                leftTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    // Ubah nilai ke format "jt"
                    if (value == 0) {
                      return '0';
                    } else if (value % 1000000 == 0) {
                      return '${(value / 1000000).toInt()} jt';
                    } else {
                      return '';
                    }
                  },
                ),
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    // Atur nilai sumbu x sesuai dengan BarChartGroupData
                    switch (value.toInt()) {
                      case 1:
                        return 'Jan';
                      case 2:
                        return 'Feb';
                      case 3:
                        return 'Mar';
                      case 4:
                        return 'Apr';
                      case 5:
                        return 'Mei';
                      case 6:
                        return 'Jun';
                      case 7:
                        return 'Jul';
                      case 8:
                        return 'Agu';
                      case 9:
                        return 'Sep';
                      case 10:
                        return 'Okt';
                      case 11:
                        return 'Nov';
                      case 12:
                        return 'Des';
                      default:
                        return '';
                    }
                  },
                ),
              ),
              gridData: FlGridData(show: true),
            ),
          ),
        ),
      );
    }

    Widget historyTransaction() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            StreamBuilder<List<TransactionWithCategory>>(
                stream: database.getTransactionByDateRepo(selectedDate),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    print(snapshot.data.toString());
                    if (snapshot.hasData) {
                      if (snapshot.data!.length > 0) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 1,
                                color: Colors.white,
                                child: ListTile(
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () async {
                                            await database
                                                .deleteTransactionRepo(snapshot
                                                    .data![index]
                                                    .transaction
                                                    .id);
                                          },
                                        ),
                                        SizedBox(width: 10),
                                        IconButton(
                                          icon: Icon(Icons.edit),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddTransaction(
                                                          transactionWithCategory:
                                                              snapshot
                                                                  .data![index],
                                                        )));
                                          },
                                        ),
                                      ],
                                    ),
                                    title: Text(
                                      "Rp. " +
                                          snapshot
                                              .data![index].transaction.jumlah
                                              .toString(),
                                    ),
                                    subtitle: Text(
                                        snapshot.data![index].category.nama),
                                    leading: Container(
                                      child: (snapshot
                                                  .data![index].category.tipe ==
                                              1)
                                          ? Icon(
                                              Icons.download,
                                              color: Colors.greenAccent[400],
                                            )
                                          : Icon(
                                              Icons.upload,
                                              color: Colors.red[400],
                                            ),
                                    )
                                    // Icon(
                                    //   Icons.upload,
                                    //   color: Colors.red,
                                    // ),
                                    ),
                              );
                            });
                      } else {
                        return Center(
                            child: Text("Data transaksi masih kosong"));
                      }
                    } else {
                      return Center(child: Text("Tidak ada data"));
                    }
                  }
                  ;
                }),
          ],
        ),
      );
    }

    Widget addTransaction() {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.history,
                            color:
                                backgroundColor1, // Mengganti backgroundColor1 dengan Colors.blue
                            size: 28,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Riwayat Transaksi",
                          style: TextStyle(
                            color:
                                backgroundColor1, // Mengganti backgroundColor1 dengan Colors.blue
                            fontSize: 18,
                            fontWeight: FontWeight
                                .bold, // Mengganti bold menjadi FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddTransaction(
                                      transactionWithCategory: null,
                                    )),
                          );
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.green,
                        ),
                        label: Text(
                          'Tambah',
                          style: TextStyle(
                              fontWeight: bold,
                              color: Colors.green), // Mengatur warna teks
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all<Color>(primaryColor),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget viewIncome() {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16), // Menambahkan jarak horizontal
          child: Column(
            children: [
              SizedBox(height: 0),
              Container(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.download,
                              color: Colors.green,
                              size: 35,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pemasukan",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        12), // Perhatikan perubahan di sini
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Rp 3.000.000",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.upload,
                              color: Colors.red,
                              size: 35,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pengeluaran",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        12), // Perhatikan perubahan di sini
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Rp 3.000.000",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                width: double.infinity,
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16)),
              )
            ],
          ),
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
        onDateChanged: (value) {
          setState(() {
            selectedDate = value;
            updateView(0, selectedDate);
            print("TANGAL : " + value.toString());
          });
        },
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
      ),
      body: ListView(
        children: <Widget>[
          viewIncome(),
          SizedBox(
            height: 4,
          ),
          barChart(),
          addTransaction(),
          historyTransaction(),
        ],
      ),
    );
  }
}
