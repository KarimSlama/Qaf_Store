class CartItemModel {
  final String productId;
  final String title;
  final double price;
  final String? image;
  int quantity;
  final String? variationId;
  final String? brandName;
  final Map<String, String>? selectedVariation;

  CartItemModel({
    required this.productId,
    required this.quantity,
    this.title = '',
    this.price = 0.0,
    this.image,
    this.variationId = '',
    this.brandName,
    this.selectedVariation,
  });

  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  CartItemModel copyWith({
    String? productId,
    String? title,
    double? price,
    String? image,
    int? quantity,
    String? variationId,
    String? brandName,
    Map<String, String>? selectedVariation,
  }) {
    return CartItemModel(
      productId: productId ?? this.productId,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      variationId: variationId ?? this.variationId,
      brandName: brandName ?? this.brandName,
      selectedVariation: selectedVariation ?? this.selectedVariation,
    );
}

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'title': title,
      'price': price,
      'image': image,
      'variationId': variationId,
      'brandName': brandName,
      'selectedVariation': selectedVariation,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
        productId: json['productId'],
        quantity: json['quantity'],
        title: json['title'],
        price: json['price'],
        image: json['image'],
        brandName: json['brandName'],
        variationId: json['variationId'],
        selectedVariation: json['selectedVariation'] != null
            ? Map<String, String>.from(json['selectedVariation'])
            : null);
  }
}
