import 'dart:convert';

class UserModel {
  String userId;
  String email;
  String username;
  UserModel({
    required this.userId,
    required this.email,
    required this.username,
  });

  UserModel copyWith({
    String? userId,
    String? email,
    String? username,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'email': email,
      'username': username,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(userId: $userId, email: $email, username: $username)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.userId == userId &&
      other.email == email &&
      other.username == username;
  }

  @override
  int get hashCode => userId.hashCode ^ email.hashCode ^ username.hashCode;
}

