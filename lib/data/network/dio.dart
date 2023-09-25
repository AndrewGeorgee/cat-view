import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  //final AppPreferences _appPreferences;

  Future<Dio> getDio() async {
    Dio dio = Dio();
    int timeOut = 60 * 10000;

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: AUTHORIZATION,
      DEFAULT_LANGUAGE: DEFAULT_LANGUAGE
    };
    dio.options = BaseOptions(
      baseUrl: 'https://194j9.wiremockapi.cloud',
      headers: headers,
      connectTimeout: Duration(
        milliseconds: timeOut,
      ),
      receiveTimeout: Duration(
        milliseconds: timeOut,
      ),
      sendTimeout: Duration(milliseconds: timeOut),
    );
    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}
