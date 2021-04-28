import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:project_akebono/models/drop_down_view.dart';
import 'package:project_akebono/models/summary_grafik.dart';
import 'package:project_akebono/models/transaksi_produksi.dart';

class ListApi {
  Future<int> loginApi(String username, String password) async {
    String sql = "http://localhost:80/akebono_project/login.php";

    var request = await http.post(
      Uri.parse("$sql"),
      // headers: {"Content-Type": "application/json"},
      body: {
        "username": username,
        "password": password,
      },
    );

    return jsonDecode(request.body)['value'];
  }

  Future<int> insertTransaksi(String username, String kode_lokasi,
      String kode_item, String qty, String date_time) async {
    String sql = "http://localhost:80/akebono_project/insert_transaksi.php";

    var request = await http.post(
      Uri.parse("$sql"),
      // headers: {"Content-Type": "application/json"},
      body: {
        "username": username,
        "kode_lokasi": kode_lokasi,
        "kode_item": kode_item,
        "qty": qty,
        "date_time": date_time,
      },
    );

    // return 1;
    return jsonDecode(request.body)['value'];
  }

  Future<DropDownView> getDropDown() async {
    String sql = "http://localhost:80/akebono_project/drop_down_list.php";

    var request = await http.post(
      Uri.parse("$sql"),
    );
    var decodeJson = jsonDecode(request.body);
    var dataValue = (decodeJson as Map<String, dynamic>);

    return new DropDownView.fromMap(dataValue);
  }

  Future<SummaryGrafik> getSummary() async {
    String sql = "http://localhost:80/akebono_project/summary_grafik.php";

    var request = await http.post(
      Uri.parse("$sql"),
    );
    var decodeJson = jsonDecode(request.body);
    var dataValue = (decodeJson as Map<String, dynamic>);

    return new SummaryGrafik.fromMap(dataValue);
  }

  Future<List<DropDownModel>> getDropDownLokasi() async {
    String sql = "http://localhost:80/akebono_project/drop_down_lokasi.php";

    var request = await http.post(
      Uri.parse("$sql"),
    );
    var decodeJson = jsonDecode(request.body);
    var dataValue = (decodeJson as List<dynamic>);

    List<DropDownModel> dataList = [];
    for (int i = 0; i < dataValue.length; i++) {
      dataList.add(new DropDownModel.fromMap(dataValue[i]));
    }
    return dataList;
  }

  Future<List<TransaksiProduksi>> getDataTransaksiProduksi(
      String kode_lokasi, String date_time) async {
    String sql = "http://localhost:80/akebono_project/view_search.php";

    var request = await http.post(
      Uri.parse("$sql"),
      body: {"kode_lokasi": kode_lokasi, "date_time": date_time},
    );
    var decodeJson = jsonDecode(request.body);
    var dataValue = (decodeJson as List<dynamic>);

    List<TransaksiProduksi> dataList = [];
    for (int i = 0; i < dataValue.length; i++) {
      dataList.add(new TransaksiProduksi.fromMap(dataValue[i]));
    }
    return dataList;
  }
}
