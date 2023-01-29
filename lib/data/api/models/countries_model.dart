import 'package:smart_group/data/api/models/continent_model.dart';

class CountriesFields {
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String capital = "capital";
  static String currency = "currency";
  static String emoji = "emoji";
  static String code = "code";
  static String code_c = "code_c";
  static String code_n = "code_n";
}

class CountryModel {
  int? id;
  String? code_c;
  String? name_c;
  String code;
  String name;
  String phone;
  Continent continent;
  String capital;
  String currency;
  String emoji;

  CountryModel(
      {required this.code_c,
      required this.name_c,
      required this.code,
      required this.name,
      required this.phone,
      required this.continent,
      required this.capital,
      required this.currency,
      required this.emoji});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      code_c: "",
      name_c: "",
      code: json['code'] ?? "",
      name: json['name'] ?? "",
      phone: json['phone'] ?? "",
      continent: Continent.fromJson(json['continent']),
      capital: json['capital'] ?? "",
      currency: json['currency'] ?? "",
      emoji: json['emoji'] ?? "",
    );
  }
  factory CountryModel.json(Map<String, dynamic> json) {
    return CountryModel(
      code_c: "",
      name_c: "",
      code: json['code'] ?? "",
      name: json['name'] ?? "",
      phone: json['phone'] ?? "",
      continent: Continent(code: json["code_c"], name: "name_c"),
      capital: json['capital'] ?? "",
      currency: json['currency'] ?? "",
      emoji: json['emoji'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['phone'] = phone;
    data['capital'] = capital;
    data['currency'] = currency;
    data['emoji'] = emoji;
    print(continent.code);
    print(continent.name);
    data["code_c"] = continent.code;
    data["name_c"] = continent.name;
    return data;
  }

  CountryModel copyWith({
    int? id,
    String? code_c,
    String? name_c,
    String? code,
    String? name,
    String? phone,
    Continent? continent,
    String? capital,
    String? currency,
    String? emoji,
  }) {
    return CountryModel(
      continent: Continent(code: "", name: ""),
      code: code ?? "",
      name: name ?? "",
      phone: phone ?? "",
      name_c: continent?.name,
      code_c: continent?.code,
      capital: capital ?? "",
      currency: currency ?? "",
      emoji: emoji ?? "",
    );
  }
}