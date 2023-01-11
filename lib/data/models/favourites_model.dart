class FavouritesModel {
  String userId;
  String productId;
  String productName;
  String productImage;
  double price;

  FavouritesModel({required this.userId,
              required this.productId,
              required this.productName,
              required this.productImage,
              required this.price,
              });
  
  factory FavouritesModel.fromJson(Map<String, dynamic> jsonData) {
    return FavouritesModel(
       userId: jsonData['userId'] ?? '', 
       productId: jsonData['productId'] ?? '', 
       productName: jsonData['productName'] ?? '', 
       productImage: jsonData['productImage'] ?? '', 
       price: jsonData['price'] ?? 0.0,
       );
  }
}