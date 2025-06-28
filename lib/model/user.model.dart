class UserModel {
  String id;
  String email;
  String username;

//<editor-fold desc="Data Methods">
  UserModel({
    required this.id,
    required this.email,
    required this.username,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          username == other.username);

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ username.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' id: $id,' +
        ' email: $email,' +
        ' username: $username,' +
        '}';
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? username,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'email': this.email,
      'username': this.username,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
    );
  }

//</editor-fold>
}
