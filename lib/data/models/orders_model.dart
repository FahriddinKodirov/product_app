class OrdersModel {
  String orderId;
  String userId;
  String productId;
  String productName;
  String productImage;
  double price;
  int count;
  double totalPrice;

  OrdersModel({required this.orderId, 
          required this.userId, 
          required this.productId, 
          required this.productName, 
          required this.productImage, 
          required this.price, 
          required this.count,
          required this.totalPrice, 
          });
  
  factory OrdersModel.fromJson(Map<String, dynamic> jsonData) {
    return OrdersModel(
       orderId: jsonData['orderId'] ?? '', 
       userId: jsonData['userId'] ?? '', 
       productId: jsonData['productId'] ?? '', 
       productName: jsonData['productName'] ?? '', 
       productImage: jsonData['productImage'] ?? '', 
       price: jsonData['price'] ?? 0.0, 
       count: jsonData['count'] ?? 0, 
       totalPrice: jsonData['totalPrice'] ?? 0.0
       );
  }
}