import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
final class City {
  City({
    required this.cityName,
    required this.town,
  });
  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  final String cityName;
  final String town;
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
