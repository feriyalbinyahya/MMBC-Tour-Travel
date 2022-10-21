class Promo {
  final String name;
  final String urlImg;

  Promo({
    required this.name,
    required this.urlImg
  });

  factory Promo.fromJson(Map<String, dynamic> json){
    return Promo(
        name: json['promo'],
        urlImg: json['urlImg']
    );
  }
}