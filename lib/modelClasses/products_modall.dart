class Product {
  String? message;
  List<Data>? data;

  Product({this.message, this.data});

  Product.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  String? oneLiner;
  int? rating;
  int? price;
  bool? isFavourite;
  bool? isMostOrder;
  String? image;
  int? iV;

  Data(
      {this.sId,
      this.title,
      this.oneLiner,
      this.rating,
      this.price,
      this.isFavourite,
      this.isMostOrder,
      this.image,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    oneLiner = json['oneLiner'];
    rating = json['rating'];
    price = json['price'];
    isFavourite = json['isFavourite'];
    isMostOrder = json['isMostOrder'];
    image = json['image'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['oneLiner'] = this.oneLiner;
    data['rating'] = this.rating;
    data['price'] = this.price;
    data['isFavourite'] = this.isFavourite;
    data['isMostOrder'] = this.isMostOrder;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}
