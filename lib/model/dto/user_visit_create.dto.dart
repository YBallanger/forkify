class UserVisitCreateDTO {
  String userId;
  String restaurantName;
  double amountSpent;
  double rating;

//<editor-fold desc="Data Methods">
  UserVisitCreateDTO({
    required this.userId,
    required this.restaurantName,
    required this.amountSpent,
    required this.rating,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserVisitCreateDTO &&
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

  UserVisitCreateDTO copyWith({
    String? userId,
    String? restaurantName,
    double? amountSpent,
    double? rating,
  }) {
    return UserVisitCreateDTO(
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

  factory UserVisitCreateDTO.fromMap(Map<String, dynamic> map) {
    return UserVisitCreateDTO(
      userId: map['userId'] as String,
      restaurantName: map['restaurantName'] as String,
      amountSpent: map['amountSpent'] as double,
      rating: map['rating'] as double,
    );
  }

//</editor-fold>
}
