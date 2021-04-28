import 'package:project_akebono/models/drop_down_view.dart';

class GetKode {
  String getKodeList(List<DropDownModel> dataList, String nama) {
    // var kode = dataList.map((e) => e.nama == nama);
    String kode = "";
    for (int i = 0; i < dataList.length; i++) {
      if (dataList[i].nama.contains(nama)) kode = dataList[i].kode;
      // if (dataList[i].nama == nama) kode == dataList[i].kode;
    }
    return kode;
  }
}
