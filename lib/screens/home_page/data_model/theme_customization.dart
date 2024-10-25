/*
 *   Webkul Software.
 *   @package Mobikul Application Code.
 *   @Category Mobikul
 *   @author Webkul <support@webkul.com>
 *   @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *   @license https://store.webkul.com/license.html
 *   @link https://store.webkul.com/license.html
 */

import 'package:bagisto_app_demo/data_model/graphql_base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'theme_customization.g.dart';

@JsonSerializable()
class ThemeCustomDataModel extends GraphQlBaseModel{
  @JsonKey(name: "data")
  List<ThemeCustomization>? themeCustomization;

  ThemeCustomDataModel({this.themeCustomization});

  factory ThemeCustomDataModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeCustomDataModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ThemeCustomDataModelToJson(this);
}

@JsonSerializable()
class ThemeCustomization {
  String? id;
  String? channelId;
  String? type;
  String? name;
  int? sortOrder;
  bool? status;
  String? baseUrl;
  List<Translations>? translations;

  ThemeCustomization({this.id, this.channelId, this.type, this.name, this.sortOrder, this.status, this.baseUrl, this.translations});

  factory ThemeCustomization.fromJson(Map<String, dynamic> json) =>
      _$ThemeCustomizationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ThemeCustomizationToJson(this);
}

@JsonSerializable()
class Translations {
  String? id;
  int? themeCustomizationId;
  String? locale;
  String? localeCode;
  Options? options;

  Translations({this.id, this.themeCustomizationId, this.locale, this.options, this.localeCode});

  factory Translations.fromJson(Map<String, dynamic> json) =>
      _$TranslationsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TranslationsToJson(this);
}

@JsonSerializable()
class Options {
  String? css;
  String? html;
  String? title;
  List<Images>? images;
  List<Filters>? filters;
  dynamic columns;
  dynamic column1;
  dynamic column2;
  dynamic column3;

  Options({this.css, this.html, this.title, this.images, this.filters, this.columns, this.column1, this.column2, this.column3});

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$OptionsToJson(this);
}

@JsonSerializable()
class Images {
  String? link;
  String? image;
  String? imageUrl;

  Images({this.link, this.image, this.imageUrl});

  factory Images.fromJson(Map<String, dynamic> json) =>
      _$ImagesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ImagesToJson(this);
}

@JsonSerializable()
class Filters {
  String? key;
  String? value;

  Filters({this.key, this.value});

  factory Filters.fromJson(Map<String, dynamic> json) =>
      _$FiltersFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FiltersToJson(this);

}
