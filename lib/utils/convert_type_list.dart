import 'package:project_akebono/models/summary_grafik.dart';

class ConvertTypeList {
  List<int> convertDataList(List<ModelDataGrafik> data) {
    List<int> dataList = [];
    for (int i = 0; i < data.length; i++) {
      dataList.add(int.parse(data[i].total));
    }
    return dataList;
  }

  List<String> getTitleDataList(List<ModelDataGrafik> data) {
    List<String> dataList = [];
    for (int i = 0; i < data.length; i++) {
      dataList.add(data[i].keterangan);
    }
    return dataList;
  }
}
