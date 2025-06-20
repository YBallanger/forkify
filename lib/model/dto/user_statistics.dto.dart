import 'dart:convert';

class UserStatisticsDTO {
  double amountSpent;
  int numberOfVisits;
  int numberOfNewRestaurants;

  UserStatisticsDTO({
    required this.amountSpent,
    required this.numberOfVisits,
    required this.numberOfNewRestaurants,
  });

  UserStatisticsDTO copyWith({
    double? amountSpent,
    int? numberOfVisits,
    int? numberOfNewRestaurants,
  }) {
    return UserStatisticsDTO(
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

  factory UserStatisticsDTO.fromMap(Map<String, dynamic> map) {
    return UserStatisticsDTO(
      amountSpent: map['amountSpent'] as double,
      numberOfVisits: map['numberOfVisits'] as int,
      numberOfNewRestaurants: map['numberOfNewRestaurants'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserStatisticsDTO.fromJson(String source) =>
      UserStatisticsDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserStatisticsDTO(amountSpent: $amountSpent, numberOfVisits: $numberOfVisits, numberOfNewRestaurants: $numberOfNewRestaurants)';

  @override
  bool operator ==(covariant UserStatisticsDTO other) {
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
