import 'package:flutter/material.dart';

class VerticalBarChart extends StatelessWidget {
  String judul;
  List<int> nilai;
  List<String> title;
  VerticalBarChart({
    Key key,
    this.judul,
    this.nilai,
    this.title,
  }) : super(key: key);

  var totalNilai = 0;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < nilai.length; i++) {
      totalNilai += nilai[i];
    }
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9, vertical: 12),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(
          //   color: Colors.blue.shade800,
          //   width: 1,
          // ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              blurRadius: 4,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              "$judul",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: nilai.map((e) {
                var index = nilai.indexOf(e);
                return barChart(
                    nilai[index],
                    context,
                    (250 * nilai[index] / ((totalNilai != 0) ? totalNilai : 1))
                        .toDouble(),
                    title[index]);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget barChart(
      int nilai, BuildContext context, double tinggi, String title) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "$nilai\n(${(nilai * 100 / ((totalNilai != 0) ? totalNilai : 1)).toStringAsFixed(2)}%)",
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5,
                fontFamily: 'Poppins',
                fontSize: 12.5,
              ),
            ),
            SizedBox(height: 1),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: tinggi,
              color: Colors.blue,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
