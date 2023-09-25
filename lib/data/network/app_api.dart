import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../responce/respoce.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: 'https://194j9.wiremockapi.cloud')
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("/home")
  Future<HomeResponse> getHomeData();
}
