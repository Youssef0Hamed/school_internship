class User {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String profileImageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.profileImageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  // Create a copy of the user with modified fields
  User copyWith({
    String? id,
    String? fullName,
    String? phoneNumber,
    String? email,
    String? profileImageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // Convert to JSON

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'fullName': fullName,
  //     'phoneNumber': phoneNumber,
  //     'email': email,
  //     'profileImageUrl': profileImageUrl,
  //     'createdAt': createdAt.toIso8601String(),
  //     'updatedAt': updatedAt.toIso8601String(),
  //   };
  // }

  // // Create from JSON
  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //     id: json['id'] as String,
  //     fullName: json['fullName'] as String,
  //     phoneNumber: json['phoneNumber'] as String,
  //     email: json['email'] as String,
  //     profileImageUrl: json['profileImageUrl'] as String,
  //     createdAt: DateTime.parse(json['createdAt'] as String),
  //     updatedAt: DateTime.parse(json['updatedAt'] as String),
  //   );
  // }
}