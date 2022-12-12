import 'package:mmbc_tour_and_travel/models/invoice/invoice_model.dart';

class PLNToken extends InvoiceModel{
  String? ppobNomormeter;
  String? ppobMaterai;
  String? ppobPpn;
  String? ppobTarifdaya;
  String? ppobPpj;
  String? ppobAngsuran;
  String? ppobRptoken;
  String? ppobTotalkwh;
  String? ppobStroomtoken;

  PLNToken({
    this.ppobNomormeter,
    this.ppobMaterai,
    this.ppobPpn,
    this.ppobTarifdaya,
    this.ppobPpj,
    this.ppobAngsuran,
    this.ppobRptoken,
    this.ppobTotalkwh,
    this.ppobStroomtoken,});

  PLNToken.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    ppobInvoice = json['ppob_invoice'];
    ppobProduk = json['ppob_produk'];
    ppobKodeproduk = json['ppob_kodeproduk'];
    ppobTanggal = json['ppob_tanggal'];
    ppobNomorpelanggan = json['ppob_nomorpelanggan'];
    ppobNamapelanggan = json['ppob_namapelanggan'];
    ppobNomormeter = json['ppob_nomormeter'];
    ppobMaterai = json['ppob_materai'];
    ppobPpn = json['ppob_ppn'];
    ppobTarifdaya = json['ppob_tarifdaya'];
    ppobPpj = json['ppob_ppj'];
    ppobAngsuran = json['ppob_angsuran'];
    ppobRptoken = json['ppob_rptoken'];
    ppobTotalkwh = json['ppob_totalkwh'];
    ppobStroomtoken = json['ppob_stroomtoken'];
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
    data['ppob_nomormeter'] = this.ppobNomormeter;
    data['ppob_materai'] = this.ppobMaterai;
    data['ppob_ppn'] = this.ppobPpn;
    data['ppob_tarifdaya'] = this.ppobTarifdaya;
    data['ppob_ppj'] = this.ppobPpj;
    data['ppob_angsuran'] = this.ppobAngsuran;
    data['ppob_rptoken'] = this.ppobRptoken;
    data['ppob_totalkwh'] = this.ppobTotalkwh;
    data['ppob_stroomtoken'] = this.ppobStroomtoken;
    data['ppob_admin'] = this.ppobAdmin;
    data['ppob_totalbayar'] = this.ppobTotalbayar;
    data['ppob_reff'] = this.ppobReff;
    data['ppob_debet'] = this.ppobDebet;
    data['ppob_kodeagen'] = this.ppobKodeagen;
    data['ppob_status'] = this.ppobStatus;
    return data;
  }

  @override
  List<String> cetakStruk(){
    List<String> listData = ["INVOICE "+ppobInvoice!, "STRUK PEMBELIAN LISTRIK PRABAYAR", ppobTanggal!, "No. Pelanggan : "+ppobNomorpelanggan!,
      "No. Meter : "+ppobNomormeter!, "Nama Pelanggan : "+ ppobNamapelanggan!, "Tarif/Daya : " + ppobTarifdaya!, "KWH : "+ppobTotalkwh!, "MATERAI : "+ ppobMaterai!,
    "PPN : "+ppobPpn!,"PPJ : "+ ppobPpj!,"ANGSURAN : "+ ppobAngsuran!, "RP STROOM : "+ ppobRptoken!, "STROOM/TOKEN : " +ppobStroomtoken!, "ADMIN : "+ppobAdmin!];
    return listData;
  }
}