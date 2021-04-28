import 'dart:convert';

class DropDownModel {
  String kode;
  String nama;
  DropDownModel({
    this.kode,
    this.nama,
  });

  Map<String, dynamic> toMap() {
    return {
      'kode': kode,
      'nama': nama,
    };
  }

  factory DropDownModel.fromMap(Map<String, dynamic> map) {
    return DropDownModel(
      kode: map['kode'],
      nama: map['nama'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DropDownModel.fromJson(String source) =>
      DropDownModel.fromMap(json.decode(source));
}

class DropDownView {
  List<DropDownModel> list_lokasi;
  List<DropDownModel> list_item;
  DropDownView({
    this.list_lokasi,
    this.list_item,
  });

  Map<String, dynamic> toMap() {
    return {
      'list_lokasi': list_lokasi?.map((x) => x.toMap())?.toList(),
      'list_item': list_item?.map((x) => x.toMap())?.toList(),
    };
  }

  factory DropDownView.fromMap(Map<String, dynamic> map) {
    return DropDownView(
      list_lokasi: List<DropDownModel>.from(
          map['list_lokasi']?.map((x) => DropDownModel.fromMap(x))),
      list_item: List<DropDownModel>.from(
          map['list_item']?.map((x) => DropDownModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DropDownView.fromJson(String source) =>
      DropDownView.fromMap(json.decode(source));
}
