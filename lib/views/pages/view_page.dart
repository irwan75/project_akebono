import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_akebono/api/list_api.dart';
import 'package:project_akebono/controller/view_page_controller.dart';
import 'package:project_akebono/models/drop_down_view.dart';
import 'package:project_akebono/models/transaksi_produksi.dart';
import 'package:project_akebono/resources/styles.dart';
import 'package:project_akebono/utils/change_format_date.dart';
import 'package:project_akebono/utils/get_kode.dart';
import 'package:project_akebono/views/widgets/drop_down_text.dart';
import 'package:project_akebono/views/widgets/form_field_text.dart';

class ViewPage extends StatelessWidget {
  TextEditingController _formTanggal =
      new TextEditingController(text: changeFormatDate(DateTime.now()));

  ListApi _listApi = new ListApi();
  GetKode _getKode = new GetKode();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<ViewPageController>(
        id: 'input_lokasi',
        init: ViewPageController(),
        builder: (controller) {
          return Column(
            children: [
              FutureBuilder<List<DropDownModel>>(
                future: _listApi.getDropDownLokasi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var result = snapshot.data;
                    return Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Rekap Transaksi Produksi",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        textFormField(
                            "Tanggal", _formTanggal, TextInputType.text, true),
                        SizedBox(height: 10),
                        dropDown("Lokasi", result, controller.lokasi, (value) {
                          controller.setLokasi(value);
                        }),
                        SizedBox(height: 30),
                        // Row(
                        //   children: [
                        //     MaterialButton(
                        //       onPressed: () {},
                        //       child: Text("Cari"),
                        //     ),
                        //     MaterialButton(
                        //       onPressed: () {},
                        //       child: Text("Clear"),
                        //     ),
                        //   ],
                        // ),
                        Table(
                          border: TableBorder.all(),
                          children: [
                            TableRow(children: [
                              Container(
                                color: Colors.green.shade200,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "No. ",
                                  style: textStyleTitleTable,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                color: Colors.green.shade200,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Tanggal",
                                  style: textStyleTitleTable,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                color: Colors.green.shade200,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Kode Item",
                                  style: textStyleTitleTable,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                color: Colors.green.shade200,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Nama Item",
                                  style: textStyleTitleTable,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                color: Colors.green.shade200,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Kode Lokasi",
                                  style: textStyleTitleTable,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                color: Colors.green.shade200,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Nama Lokasi",
                                  style: textStyleTitleTable,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                color: Colors.green.shade200,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Qty Actual",
                                  style: textStyleTitleTable,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                color: Colors.green.shade200,
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Created By",
                                  style: textStyleTitleTable,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ]),
                          ],
                        ),
                        FutureBuilder<List<TransaksiProduksi>>(
                          future: _listApi.getDataTransaksiProduksi(
                              _getKode.getKodeList(result, controller.lokasi),
                              DateTime.now().toString().split(" ")[0]),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var hasil = snapshot.data;
                              return Table(
                                border: TableBorder.all(),
                                children: hasil.map((e) {
                                  var index = hasil.indexOf(e);
                                  return TableRow(children: [
                                    Container(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "${index + 1}",
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "${e.tanggal_transaksi}",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "${e.kode}",
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "${e.nama_item}",
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "${e.lokasi}",
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "${e.nama_lokasi}",
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "${e.qty_actual}",
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "${e.npk}",
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ]);
                                }).toList(),
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
