import 'dart:convert';

class RestaurantModel {
  String name;
  RestaurantModel({
    required this.name,
  });

  RestaurantModel copyWith({
    String? name,
  }) {
    return RestaurantModel(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantModel.fromJson(String source) =>
      RestaurantModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RestaurantModel(name: $name)';

  @override
  bool operator ==(covariant RestaurantModel other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
