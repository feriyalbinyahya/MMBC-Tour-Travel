class RecommendedHotel {
  int? _id;
  late String _name;
  late String _city;
  late String _classHotel;
  late String _price;
  late String _urlImg;

  String get name => _name;

  String get city => _city;

  String get classHotel => _classHotel;

  String get price => _price;

  String get urlImg => _urlImg;


  RecommendedHotel(
      {required name, required city, required classHotel, required price, required urlImg}) {
    this._name = name;
    this._city = city;
    this._classHotel = classHotel;
    this._price = price;
    this._urlImg = urlImg;
  }

  RecommendedHotel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _city = json['city'];
    _classHotel = json['classHotel'];
    _price = json['price'];
    _urlImg = json['urlImg'];
  }
}