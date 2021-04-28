import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:project_akebono/api/list_api.dart';
import 'package:project_akebono/controller/input_controller.dart';
import 'package:project_akebono/models/drop_down_view.dart';
import 'package:project_akebono/services/default_dialog.dart';
import 'package:project_akebono/services/storage_preferences.dart';
import 'package:project_akebono/utils/change_format_date.dart';
import 'package:project_akebono/utils/get_kode.dart';
import 'package:project_akebono/views/widgets/drop_down_text.dart';
import 'package:project_akebono/views/widgets/form_field_text.dart';

class InputPage extends StatelessWidget {
  TextEditingController _formTanggal =
      new TextEditingController(text: changeFormatDate(DateTime.now()));
  TextEditingController _formQty = new TextEditingController();

  ListApi _listApi = new ListApi();
  StoragePreferences _storagePreferences = new StoragePreferences();
  GetKode _getKode = new GetKode();

  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp;

  @override
  Widget build(BuildContext context) {
    regExp = new RegExp(patttern);
    return Container(
      child: FutureBuilder<DropDownView>(
        future: _listApi.getDropDown(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var result = snapshot.data;
            return GetBuilder<InputController>(
              init: InputController(),
              id: 'refresh_page',
              builder: (controller) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Input Transaksi Produks",
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
                    GetBuilder<InputController>(
                      id: 'input_lokasi',
                      init: InputController(),
                      builder: (controller) {
                        return dropDown(
                            "Lokasi", result.list_lokasi, controller.lokasi,
                            (value) {
                          controller.setLokasi(value);
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    GetBuilder<InputController>(
                      id: 'input_item',
                      init: InputController(),
                      builder: (controller) {
                        return dropDown(
                            "Item", result.list_item, controller.item, (value) {
                          controller.setItem(value);
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    textFormField("Qty", _formQty, TextInputType.number, false),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          color: Colors.green,
                          onPressed: () async {
                            if (!regExp.hasMatch(_formQty.text.trim())) {
                              viewDefaultDialog(
                                  "Pastikan Form QTY hanya berupa angka");
                            } else if (_formQty.text.isEmpty ||
                                _formQty.text == "") {
                              viewDefaultDialog(
                                  "Mohon Isi Data Qty Terlebih Dahulu");
                            } else {
                              var hasil = await _listApi.insertTransaksi(
                                  _storagePreferences.getUsername(),
                                  _getKode.getKodeList(
                                      result.list_lokasi,
                                      Get.find<InputController>()
                                          .lokasi
                                          .toString()),
                                  _getKode.getKodeList(
                                      result.list_item,
                                      Get.find<InputController>()
                                          .item
                                          .toString()),
                                  _formQty.text.trim(),
                                  DateTime.now().toString());
                              if (hasil == 0) {
                                viewDefaultDialog("Data Gagal Terkirim");
                              } else {
                                viewDefaultDialog("Data Berhasil Terkirim");
                                _formQty = TextEditingController(text: "");
                                controller.refreshPage();
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 7),
                            child: Text(
                              "Simpan",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        MaterialButton(
                          color: Colors.grey,
                          onPressed: () {
                            _formQty = TextEditingController(text: "");
                            controller.refreshPage();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 7),
                            child: Text(
                              "Clear",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
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
