import 'dart:convert';

class TransaksiProduksi {
  String tanggal_transaksi;
  String kode;
  String nama_item;
  String lokasi;
  String nama_lokasi;
  String qty_actual;
  String npk;
  TransaksiProduksi({
    this.tanggal_transaksi,
    this.kode,
    this.nama_item,
    this.lokasi,
    this.nama_lokasi,
    this.qty_actual,
    this.npk,
  });

  Map<String, dynamic> toMap() {
    return {
      'tanggal_transaksi': tanggal_transaksi,
      'kode': kode,
      'nama_item': nama_item,
      'lokasi': lokasi,
      'nama_lokasi': nama_lokasi,
      'qty_actual': qty_actual,
      'npk': npk,
    };
  }

  factory TransaksiProduksi.fromMap(Map<String, dynamic> map) {
    return TransaksiProduksi(
      tanggal_transaksi: map['tanggal_transaksi'],
      kode: map['kode'],
      nama_item: map['nama_item'],
      lokasi: map['lokasi'],
      nama_lokasi: map['nama_lokasi'],
      qty_actual: map['qty_actual'],
      npk: map['npk'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransaksiProduksi.fromJson(String source) =>
      TransaksiProduksi.fromMap(json.decode(source));
}
