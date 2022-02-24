// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    required this.status,
    required this.statusCode,
    required this.version,
    required this.access,
    required this.data,
  });

  String status;
  int statusCode;
  String version;
  String access;
  Map<String, Datum> data;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    status: json["status"],
    statusCode: json["status-code"],
    version: json["version"],
    access: json["access"],
    data: Map.from(json["data"]).map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status-code": statusCode,
    "version": version,
    "access": access,
    "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Datum {
  Datum({
    required this.country,
    required this.region,
  });

  String country;
  Region region;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    country: json["country"],
    region: regionValues.map[json["region"]]!,
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "region": regionValues.reverse![region],
  };
}

enum Region { ASIA, AFRICA, ANTARCTIC, CENTRAL_AMERICA }

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Antarctic": Region.ANTARCTIC,
  "Asia": Region.ASIA,
  "Central America": Region.CENTRAL_AMERICA
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
