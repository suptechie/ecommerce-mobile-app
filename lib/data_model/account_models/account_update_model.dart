/*
 *   Webkul Software.
 *   @package Mobikul Application Code.
 *   @Category Mobikul
 *   @author Webkul <support@webkul.com>
 *   @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *   @license https://store.webkul.com/license.html
 *   @link https://store.webkul.com/license.html
 */


import 'package:json_annotation/json_annotation.dart';

import '../graphql_base_model.dart';

part 'account_update_model.g.dart';

@JsonSerializable()
class AccountUpdate extends BaseModel{
  @JsonKey(name: "customer")
  Data? data;

  AccountUpdate({this.data});

  factory AccountUpdate.fromJson(Map<String, dynamic> json) =>
      _$AccountUpdateFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AccountUpdateToJson(this);
}
@JsonSerializable()
class Data {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? name;
  String? gender;
  String? dateOfBirth;
  String? phone;
  String? imageUrl;
  bool? status;
  Group? group;
  bool? subscribedToNewsLetter;

  Data(
      {this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.name,
        this.gender,
        this.dateOfBirth,
        this.phone,
        this.status,
        this.group,
        this.imageUrl,
        this.subscribedToNewsLetter
     });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DataToJson(this);

}
@JsonSerializable()
class Group {
  int? id;
  String? name;
Group({this.id,this.name});
  factory Group.fromJson(Map<String, dynamic> json) =>
      _$GroupFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GroupToJson(this);
}