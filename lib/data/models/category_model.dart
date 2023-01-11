class CategoryModel {
  String categoryId;
  String categoryName;
  String description;
  String createdAt;
  String icon;

  CategoryModel({required this.categoryId,
            required this.categoryName,
            required this.description,
            required this.createdAt,
            required this.icon,
           });
  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
       categoryId: jsonData['categoryId'] ?? '', 
       categoryName: jsonData['categoryName'] ?? '', 
       description: jsonData['description'] ?? '', 
       createdAt: jsonData['createdAt'] ?? '', 
       icon: jsonData['icon'] ?? '',
       );
  }

  Map<String, dynamic> toJson() => 
   {
    'categoryId':categoryId,
    'categoryName':categoryName,
    'description':description,
    'createdAt':createdAt,
    'icon':icon,
  };

  void updateCategory(CategoryModel categoryModel) {}
}