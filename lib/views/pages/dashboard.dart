import 'package:flutter/material.dart';
import 'package:project_akebono/api/list_api.dart';
import 'package:project_akebono/models/summary_grafik.dart';
import 'package:project_akebono/utils/convert_type_list.dart';
import 'package:project_akebono/views/widgets/graph_container.dart';
import 'package:project_akebono/views/widgets/vertical_bar_chart.dart';

class Dashboard extends StatelessWidget {
  ListApi _listApi = new ListApi();
  ConvertTypeList _convertTypeList = new ConvertTypeList();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SummaryGrafik>(
        future: _listApi.getSummary(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var hasil = snapshot.data;
            return Column(
              children: [
                Row(
                  children: [
                    GraphContainer(
                      title: "Total\nKaryawan",
                      value: int.parse(hasil.jumlah_karyawan),
                    ),
                    GraphContainer(
                      title: "Total\nItem",
                      value: int.parse(hasil.jumlah_item),
                    ),
                    GraphContainer(
                      title: "Total\nLokasi",
                      value: int.parse(hasil.jumlah_lokasi),
                    ),
                    GraphContainer(
                      title: "Total\nTransaksi",
                      value: int.parse(hasil.jumlah_transaksi_produksi),
                    ),
                  ],
                ),
                Row(children: [
                  VerticalBarChart(
                    judul: "Top 5 Asal Karyawan",
                    nilai: _convertTypeList
                        .convertDataList(hasil.top_5_alamat_karyawan),
                    title: _convertTypeList
                        .getTitleDataList(hasil.top_5_alamat_karyawan),
                  ),
                  VerticalBarChart(
                    judul: "Top 5 Lokasi Transaksi",
                    nilai: _convertTypeList
                        .convertDataList(hasil.top_5_lokasi_transaksi),
                    title: _convertTypeList
                        .getTitleDataList(hasil.top_5_lokasi_transaksi),
                  ),
                ]),
                Row(children: [
                  VerticalBarChart(
                    judul: "Top 5 Item transaksi",
                    nilai: _convertTypeList
                        .convertDataList(hasil.top_5_item_transaksi),
                    title: _convertTypeList
                        .getTitleDataList(hasil.top_5_item_transaksi),
                  ),
                  VerticalBarChart(
                    judul: "Total Transaksi By Tanggal",
                    nilai: _convertTypeList
                        .convertDataList(hasil.grafik_transaksi_by_date),
                    title: _convertTypeList
                        .getTitleDataList(hasil.grafik_transaksi_by_date),
                  ),
                ]),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
