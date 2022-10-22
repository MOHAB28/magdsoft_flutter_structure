import '../../models/home_model.dart';

class HomeResponse extends HomeModel {
  final List<ProductResponse>? productR;
  HomeResponse({
    int? status,
    String? message,
    this.productR,
  }) : super(
          message: message!,
          product: productR!,
          status: status!,
        );

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    List<ProductResponse> products = [];
    if (json['products'] != null) {
      for (var product in json['products']) {
        products.add(ProductResponse.fromJson(product));
      }
    }
    return HomeResponse(
      message: json['message'],
      productR: products,
      status: json['status'],
    );
  }
}

class ProductResponse extends ProductModel {
  ProductResponse({
    int? id,
    String? company,
    String? name,
    String? type,
    String? price,
    String? image,
    String? description,
  }) : super(
          id: id!,
          company: company!,
          description: description!,
          image: image!,
          name: name!,
          price: price!,
          type: type!,
        );

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      id: json['id'],
      company: json['company'],
      description: json['description'],
      image: json['image'],
      name: json['name'],
      price: json['price'],
      type: json['type'],
    );
  }
}
