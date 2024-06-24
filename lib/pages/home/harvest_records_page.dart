import 'package:asisten_petani/theme.dart';
import 'package:flutter/material.dart';
import 'package:asisten_petani/pages/add_harvest.dart';
import 'package:fl_chart/fl_chart.dart';

class HarvestRecordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget lineChart() {
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
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(2020, 10),
                    FlSpot(2021, 20),
                    FlSpot(2022, 15),
                    FlSpot(2023, 25),
                  ],
                  isCurved: true,
                  colors: [buttonColor1],
                  barWidth: 4,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(show: false),
                ),
              ],
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.black, width: 1),
              ),
              titlesData: FlTitlesData(
                leftTitles: SideTitles(showTitles: true),
                bottomTitles: SideTitles(
                  showTitles: true,
                  // Membuat penyesuaian untuk sumbu x (bottom)
                  // Menggunakan format untuk menampilkan tahun sebagai bilangan bulat
                  // Ubah sesuai kebutuhan Anda.
                  getTitles: (value) {
                    switch (value.toInt()) {
                      case 2020:
                        return '2020';
                      case 2021:
                        return '2021';
                      case 2022:
                        return '2022';
                      case 2023:
                        return '2023';
                      default:
                        return '${value.toInt()}'; // Menggunakan value.toInt() untuk menampilkan tahun tanpa disingkat
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
            Card(
              elevation: 1,
              color: Colors.white,
              child: ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 10),
                    Icon(Icons.edit),
                  ],
                ),
                title: Text("40 Ton"),
                subtitle: Text("tanggal"),
                leading: Icon(
                  Icons.grain_outlined,
                  color: buttonColor1,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget addHarvest() {
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
                          "Riwayat Panen",
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
                                builder: (context) => AddHarvest()),
                          );
                        },
                        icon: Icon(
                          Icons.add,
                          color: buttonColor1,
                        ),
                        label: Text(
                          'Tambah',
                          style: TextStyle(
                              fontWeight: bold,
                              color: buttonColor1), // Mengatur warna teks
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primaryColor),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget viewPanen() {
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
                              color: buttonColor1,
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
                                "Tahun Ini",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        12), // Perhatikan perubahan di sini
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "25 Ton",
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
                                "Tahun Sebelumnya",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        12), // Perhatikan perubahan di sini
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "15 Ton",
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
      appBar: AppBar(
        backgroundColor: buttonColor1,
        title: Text(
          'Hasil Panen',
          style: TextStyle(color: primaryColor),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          viewPanen(),
          SizedBox(
            height: 4,
          ),
          lineChart(),
          addHarvest(),
          historyTransaction(),
        ],
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> alldata = ['kamu', 'saya', 'anda'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in alldata) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var results = matchQuery[index];
          return ListTile(title: Text(results));
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in alldata) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var results = matchQuery[index];
          return ListTile(title: Text(results));
        });
  }
}
