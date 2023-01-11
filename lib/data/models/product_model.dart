class ProductModel {
  String productId;
  String categoryId;
  String productName;
  int price;
  String currency;
  String description;
  String count;
  String imageUrl;
  int rate;

  ProductModel({
           required this.productId,
           required this.categoryId,
           required this.productName,
           required this.price,
           required this.currency,
           required this.description,
           required this.count,
           required this.imageUrl,
           required this.rate,
   });

factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
  return ProductModel(
     productId: jsonData['productId'] ?? '', 
     categoryId: jsonData['categoryId'] ?? '', 
     productName: jsonData['productName'] ?? '', 
     price: jsonData['price'] ?? 0, 
     currency: jsonData['currency'] ?? '', 
     description: jsonData['description'] ?? '', 
     count: jsonData['count'] ?? '', 
     imageUrl: jsonData['imageUrl'] ?? '', 
     rate: jsonData['rate'] ?? 0,
     );
}

Map<String, dynamic> toJson() =>
 {
  'productId':productId,
  'categoryId':categoryId,
  'productName':productName,
  'price':price,
  'currency':currency,
  'description':description,
  'count':count,
  'imageUrl':imageUrl,
  'rate':rate,
 };

}