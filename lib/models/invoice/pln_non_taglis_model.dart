import 'package:mmbc_tour_and_travel/models/invoice/invoice_model.dart';

class PLNNonTaglis extends InvoiceModel{
  String? ppobNomorregistrasi;
  String? ppobJenisbayar;

  PLNNonTaglis(
      {
        this.ppobNomorregistrasi,
        this.ppobJenisbayar,});

  PLNNonTaglis.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    ppobInvoice = json['ppob_invoice'];
    ppobProduk = json['ppob_produk'];
    ppobKodeproduk = json['ppob_kodeproduk'];
    ppobTanggal = json['ppob_tanggal'];
    ppobNomorregistrasi = json['ppob_nomorregistrasi'];
    ppobNomorpelanggan = json['ppob_nomorpelanggan'];
    ppobJenisbayar = json['ppob_jenisbayar'];
    ppobNamapelanggan = json['ppob_namapelanggan'];
    ppobTotaltagihan = json['ppob_totaltagihan'];
    ppobAdmin = json['ppob_admin'];
    ppobTotalbayar = json['ppob_totalbayar'];
    ppobReff = json['ppob_reff'];
    ppobDebet = json['ppob_debet'];
    ppobKodeagen = json['ppob_kodeagen'];
    ppobStatus = json['ppob_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['ppob_invoice'] = this.ppobInvoice;
    data['ppob_produk'] = this.ppobProduk;
    data['ppob_kodeproduk'] = this.ppobKodeproduk;
    data['ppob_tanggal'] = this.ppobTanggal;
    data['ppob_nomorregistrasi'] = this.ppobNomorregistrasi;
    data['ppob_nomorpelanggan'] = this.ppobNomorpelanggan;
    data['ppob_jenisbayar'] = this.ppobJenisbayar;
    data['ppob_namapelanggan'] = this.ppobNamapelanggan;
    data['ppob_totaltagihan'] = this.ppobTotaltagihan;
    data['ppob_admin'] = this.ppobAdmin;
    data['ppob_totalbayar'] = this.ppobTotalbayar;
    data['ppob_reff'] = this.ppobReff;
    data['ppob_debet'] = this.ppobDebet;
    data['ppob_kodeagen'] = this.ppobKodeagen;
    data['ppob_status'] = this.ppobStatus;
    return data;
  }

  @override
  List<String> cetakStruk() {
    // TODO: implement cetakStruk
    throw UnimplementedError();
  }
}