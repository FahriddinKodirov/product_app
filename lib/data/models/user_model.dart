class UserModel {
  String userId;
  String email;
  String fullName;
  String phoneNumber;
  String imageUrl;
  String fcmToken;

  UserModel({required this.userId,
        required this.email,
        required this.fullName,
        required this.phoneNumber,
        required this.imageUrl,
        required this.fcmToken,
        });
      
  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
       userId: jsonData['userId'] ?? '', 
       email: jsonData['email'] ?? '', 
       fullName: jsonData['fullName'] ?? '', 
       phoneNumber: jsonData['phone_number'] ?? '', 
       imageUrl: jsonData['imageUrl'] ?? '', 
       fcmToken: jsonData['fcmToken'] ?? ''
       );
  }
}