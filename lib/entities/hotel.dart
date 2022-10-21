class Hotel {
  final String name;
  final String city;
  final String classHotel;
  final String price;
  final String urlImg;

  Hotel({
    required this.name,
    required this.city,
    required this.classHotel,
    required this.price,
    required this.urlImg
  });

  factory Hotel.fromJson(Map<String, dynamic> json){
    return Hotel(
      name: json['name'],
      city: json['city'],
      classHotel: json['classHotel'],
      price: json['price'],
      urlImg: json['urlImg']
    );
  }
}