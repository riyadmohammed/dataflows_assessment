class ProductModel {
  String? title;
  String? description;
  String? price;
  String? imagePath;
  final String? oldPrice;
  final int? discount;

  ProductModel({
    this.title,
    this.description,
    this.price,
    this.imagePath,
    this.oldPrice,
    this.discount,
  });
}
