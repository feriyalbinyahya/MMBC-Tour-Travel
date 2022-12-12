import 'package:mmbc_tour_and_travel/models/invoice/invoice_model.dart';

class MCF extends InvoiceModel{
  String? ppobNomorpolisi;
  String? ppobKendaraan;
  String? ppobAngsuranke;
  String? ppobSisatenor;
  String? ppobJatuhtempo;
  String? ppobAngsuran;
  String? ppobDenda;

  MCF(
      {
        this.ppobNomorpolisi,
        this.ppobKendaraan,
        this.ppobAngsuranke,
        this.ppobSisatenor,
        this.ppobJatuhtempo,
        this.ppobAngsuran,
        this.ppobDenda,});

  MCF.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    ppobInvoice = json['ppob_invoice'];
    ppobProduk = json['ppob_produk'];
    ppobKodeproduk = json['ppob_kodeproduk'];
    ppobTanggal = json['ppob_tanggal'];
    ppobNomorpelanggan = json['ppob_nomorpelanggan'];
    ppobNamapelanggan = json['ppob_namapelanggan'];
    ppobNomorpolisi = json['ppob_nomorpolisi'];
    ppobKendaraan = json['ppob_kendaraan'];
    ppobAngsuranke = json['ppob_angsuranke'];
    ppobSisatenor = json['ppob_sisatenor'];
    ppobJatuhtempo = json['ppob_jatuhtempo'];
    ppobAngsuran = json['ppob_angsuran'];
    ppobDenda = json['ppob_denda'];
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
    data['ppob_nomorpelanggan'] = this.ppobNomorpelanggan;
    data['ppob_namapelanggan'] = this.ppobNamapelanggan;
    data['ppob_nomorpolisi'] = this.ppobNomorpolisi;
    data['ppob_kendaraan'] = this.ppobKendaraan;
    data['ppob_angsuranke'] = this.ppobAngsuranke;
    data['ppob_sisatenor'] = this.ppobSisatenor;
    data['ppob_jatuhtempo'] = this.ppobJatuhtempo;
    data['ppob_angsuran'] = this.ppobAngsuran;
    data['ppob_denda'] = this.ppobDenda;
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