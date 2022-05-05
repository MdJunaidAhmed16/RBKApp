import 'package:flutter/material.dart';

class mspVal extends StatelessWidget {
  const mspVal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("MSP values"),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Table(
            defaultColumnWidth: FlexColumnWidth(120.0),
            border: TableBorder.all(
              color: Colors.black,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            children: [
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "S.No",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Crop Name",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Season",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "1",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Tumeric",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "6850/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Rabi",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "2",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Mirchi",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "7000/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Kharif",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "3",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Onion",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "770/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Rabi\nKharif",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "4",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Small grains",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "2500/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Rabi\nKharif",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "5",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Wheat(Common)",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "1940/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Rabi\nKharif",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "6",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Wheat(Grade-A)",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "1960/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Rabi\nKarif",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "7",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Jonnalu",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "2758/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Rabi\nKharif",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "8",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Sajjalu",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "250/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Rabi\nKharif",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "9",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Ragulu",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "3377/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Rabi\nKharif",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "10",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Corn",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "1870/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Rabi",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "11",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Kandulu",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "5300/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Rabi",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "12",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Pesalu",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "7275/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Rabi",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "13",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Minumulu",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "6300/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Rabi",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "14",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Groundnut",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "5550/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Kharif",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "15",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Coconut-A",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "10335/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Aug to Feb",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "16",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Coconut-B",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "10600/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Aug to Feb",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "17",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Cotton-Short seed",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "5726/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Khairf",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "18",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Cotton - long seed",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "6025/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Rabi",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "19",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Orange",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "1400/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Apr to Jun",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ]),
              TableRow(children: [
                Column(
                  children: [
                    Text(
                      "20",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Banana",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "800/-",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Rabi",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
