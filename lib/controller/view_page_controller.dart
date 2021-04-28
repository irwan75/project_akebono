import 'package:get/get.dart';

class ViewPageController extends GetxController {
  String lokasi = "Lokasi 1";

  void setLokasi(String val) {
    lokasi = val;
    update(['input_lokasi']);
  }
}
