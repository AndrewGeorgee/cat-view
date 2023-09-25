import 'package:json_annotation/json_annotation.dart';

part 'respoce.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'status')
  int? statuse;
  @JsonKey(name: 'message')
  String? message;
}

@JsonSerializable()
class CatImageResponse {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'width')
  double? width;
  @JsonKey(name: 'height')
  double? height;
  @JsonKey(name: 'url')
  String? image;

  CatImageResponse(this.id, this.width, this.height, this.image);

  // toJson
  Map<String, dynamic> toJson() => _$CatImageResponseToJson(this);

//fromJson
  factory CatImageResponse.fromJson(Map<String, dynamic> json) =>
      _$CatImageResponseFromJson(json);
}

@JsonSerializable()
class HomeDataResponse {
  @JsonKey(name: 'services')
  List<CatImageResponse>? services;

  HomeDataResponse(this.services);

  // toJson
  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);

//fromJson
  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);
}

@JsonSerializable()
class HomeResponse extends BaseResponse {
  @JsonKey(name: 'data')
  HomeDataResponse? data;

  HomeResponse(this.data);

  // toJson
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);

//fromJson
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
}
