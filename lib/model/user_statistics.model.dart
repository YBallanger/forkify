import 'dart:convert';

class UserStatisticsModel {
  factory UserStatisticsModel.fromMap(Map<String, dynamic> map) {
    return UserStatisticsModel(
      amountSpent: map['amountSpent'] as double,
      numberOfVisits: map['numberOfVisits'] as int,
      numberOfNewRestaurants: map['numberOfNewRestaurants'] as int,
    );
  }

  UserStatisticsModel({
    required this.amountSpent,
    required this.numberOfVisits,
    required this.numberOfNewRestaurants,
  });

  factory UserStatisticsModel.fromJson(String source) =>
      UserStatisticsModel.fromMap(json.decode(source) as Map<String, dynamic>);
  double amountSpent;
  int numberOfVisits;
  int numberOfNewRestaurants;

  UserStatisticsModel copyWith({
    double? amountSpent,
    int? numberOfVisits,
    int? numberOfNewRestaurants,
  }) {
    return UserStatisticsModel(
      amountSpent: amountSpent ?? this.amountSpent,
      numberOfVisits: numberOfVisits ?? this.numberOfVisits,
      numberOfNewRestaurants:
          numberOfNewRestaurants ?? this.numberOfNewRestaurants,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amountSpent': amountSpent,
      'numberOfVisits': numberOfVisits,
      'numberOfNewRestaurants': numberOfNewRestaurants,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'UserStatisticsModel(amountSpent: $amountSpent, numberOfVisits: $numberOfVisits, numberOfNewRestaurants: $numberOfNewRestaurants)';

  @override
  bool operator ==(covariant UserStatisticsModel other) {
    if (identical(this, other)) return true;

    return other.amountSpent == amountSpent &&
        other.numberOfVisits == numberOfVisits &&
        other.numberOfNewRestaurants == numberOfNewRestaurants;
  }

  @override
  int get hashCode =>
      amountSpent.hashCode ^
      numberOfVisits.hashCode ^
      numberOfNewRestaurants.hashCode;
}
