import 'dart:convert';

class Rating {
  final String userId;
  final double rating;

  Rating({required this.userId, required this.rating});

  // Chuyển đổi Rating object thành JSON
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'rating': rating,
    };
  }

  // Tạo Rating object từ JSON
   factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      userId: map['userId'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
    );
  }

  // Chuyển đổi Rating object thành chuỗi JSON
  String toJson() => json.encode(toMap());

  // Tạo Rating object từ chuỗi JSON
   factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source));
}