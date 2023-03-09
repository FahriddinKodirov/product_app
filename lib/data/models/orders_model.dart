class OrdersModel {
  String orderId;
  String userId;
  String productId;
  String productName;
  String productImage;
  int price;
  int count;
  int totalPrice;

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
       price: jsonData['price'] ?? 0, 
       count: jsonData['count'] ?? 0, 
       totalPrice: jsonData['totalPrice'] ?? 0
       );
  }

  Map<String, dynamic> toJson() => 
  {
  'orderId':orderId,
  'userId':userId,
  'productId':productId,
  'productName':productName,
  'productImage':productImage,
  'price':price,
  'count':count,
  'totalPrice':totalPrice,
 };

 OrdersModel copyWith({
   String? orderId,
   String? userId,
   String? productId,
   String? productName,
   String? productImage,
   int? price,
   int? totalPrice,
   int? count,
}) =>
   OrdersModel(
    orderId: orderId ?? this.orderId, 
    userId: userId ?? this.userId, 
    productId: productId ?? this.productId, 
    productName: productName ?? this.productName, 
    productImage: productImage ?? this.productImage, 
    price: price ?? this.price, 
    count: count ?? this.count, 
    totalPrice: totalPrice ?? this.totalPrice,
    );
}