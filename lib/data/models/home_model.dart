class HomeModel {
  final int status;
  final String message;
  final List<ProductModel> product;
  const HomeModel({
    required this.message,
    required this.product,
    required this.status,
  });
}

class ProductModel {
  final int id;
  final String company;
  final String name;
  final String type;
  final String price;
  final String image;
  final String description;
  const ProductModel({
    required this.company,
    required this.description,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.type,
  });
}
