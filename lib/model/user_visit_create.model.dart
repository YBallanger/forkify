class UserVisitCreateModel {
  String userId;
  String restaurantName;
  double amountSpent;
  double rating;

//<editor-fold desc="Data Methods">
  UserVisitCreateModel({
    required this.userId,
    required this.restaurantName,
    required this.amountSpent,
    required this.rating,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserVisitCreateModel &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          restaurantName == other.restaurantName &&
          amountSpent == other.amountSpent &&
          rating == other.rating);

  @override
  int get hashCode =>
      userId.hashCode ^
      restaurantName.hashCode ^
      amountSpent.hashCode ^
      rating.hashCode;

  @override
  String toString() {
    return 'UserVisitCreateDTO{' +
        ' userId: $userId,' +
        ' restaurantName: $restaurantName,' +
        ' amountSpent: $amountSpent,' +
        ' rating: $rating,' +
        '}';
  }

  UserVisitCreateModel copyWith({
    String? userId,
    String? restaurantName,
    double? amountSpent,
    double? rating,
  }) {
    return UserVisitCreateModel(
      userId: userId ?? this.userId,
      restaurantName: restaurantName ?? this.restaurantName,
      amountSpent: amountSpent ?? this.amountSpent,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'restaurantName': this.restaurantName,
      'amountSpent': this.amountSpent,
      'rating': this.rating,
    };
  }

  factory UserVisitCreateModel.fromMap(Map<String, dynamic> map) {
    return UserVisitCreateModel(
      userId: map['userId'] as String,
      restaurantName: map['restaurantName'] as String,
      amountSpent: map['amountSpent'] as double,
      rating: map['rating'] as double,
    );
  }

//</editor-fold>
}
