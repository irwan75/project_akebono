import 'package:get/get.dart';

class InputController extends GetxController {
  String lokasi = "Lokasi 1";
  String item = "Bolpen";

  void setLokasi(String val) {
    lokasi = val;
    update(['input_lokasi']);
  }

  void setItem(String val) {
    item = val;
    update(['input_item']);
  }

  void refreshPage() {
    update(['refresh_page']);
  }
}
