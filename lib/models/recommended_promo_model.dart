class Promo {
  int? _id;
  late String _promo;
  late String _urlImg;

  String get promo => _promo;

  String get urlImg => _urlImg;


  Promo(
      {required promo, required urlImg}) {
    this._promo = promo;
    this._urlImg = urlImg;
  }

  Promo.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _promo = json['promo'];
    _urlImg = json['urlImg'];
  }
}