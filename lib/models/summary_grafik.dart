import 'dart:convert';

class ModelDataGrafik {
  String keterangan;
  String total;
  ModelDataGrafik({
    this.keterangan,
    this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'keterangan': keterangan,
      'total': total,
    };
  }

  factory ModelDataGrafik.fromMap(Map<String, dynamic> map) {
    return ModelDataGrafik(
      keterangan: map['keterangan'],
      total: map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelDataGrafik.fromJson(String source) =>
      ModelDataGrafik.fromMap(json.decode(source));
}

class SummaryGrafik {
  String jumlah_karyawan;
  String jumlah_item;
  String jumlah_lokasi;
  String jumlah_transaksi_produksi;
  List<ModelDataGrafik> top_5_alamat_karyawan;
  List<ModelDataGrafik> top_5_lokasi_transaksi;
  List<ModelDataGrafik> top_5_item_transaksi;
  List<ModelDataGrafik> grafik_transaksi_by_date;
  SummaryGrafik({
    this.jumlah_karyawan,
    this.jumlah_item,
    this.jumlah_lokasi,
    this.jumlah_transaksi_produksi,
    this.top_5_alamat_karyawan,
    this.top_5_lokasi_transaksi,
    this.top_5_item_transaksi,
    this.grafik_transaksi_by_date,
  });

  Map<String, dynamic> toMap() {
    return {
      'jumlah_karyawan': jumlah_karyawan,
      'jumlah_item': jumlah_item,
      'jumlah_lokasi': jumlah_lokasi,
      'jumlah_transaksi_produksi': jumlah_transaksi_produksi,
      'top_5_alamat_karyawan':
          top_5_alamat_karyawan?.map((x) => x.toMap())?.toList(),
      'top_5_lokasi_transaksi':
          top_5_lokasi_transaksi?.map((x) => x.toMap())?.toList(),
      'top_5_item_transaksi':
          top_5_item_transaksi?.map((x) => x.toMap())?.toList(),
      'grafik_transaksi_by_date':
          grafik_transaksi_by_date?.map((x) => x.toMap())?.toList(),
    };
  }

  factory SummaryGrafik.fromMap(Map<String, dynamic> map) {
    return SummaryGrafik(
      jumlah_karyawan: map['jumlah_karyawan'],
      jumlah_item: map['jumlah_item'],
      jumlah_lokasi: map['jumlah_lokasi'],
      jumlah_transaksi_produksi: map['jumlah_transaksi_produksi'],
      top_5_alamat_karyawan: List<ModelDataGrafik>.from(
          map['top_5_alamat_karyawan']?.map((x) => ModelDataGrafik.fromMap(x))),
      top_5_lokasi_transaksi: List<ModelDataGrafik>.from(
          map['top_5_lokasi_transaksi']
              ?.map((x) => ModelDataGrafik.fromMap(x))),
      top_5_item_transaksi: List<ModelDataGrafik>.from(
          map['top_5_item_transaksi']?.map((x) => ModelDataGrafik.fromMap(x))),
      grafik_transaksi_by_date: List<ModelDataGrafik>.from(
          map['grafik_transaksi_by_date']
              ?.map((x) => ModelDataGrafik.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SummaryGrafik.fromJson(String source) =>
      SummaryGrafik.fromMap(json.decode(source));
}
