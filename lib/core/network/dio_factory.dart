import 'package:dio/dio.dart';
import 'package:fintech_app/core/constants/api_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final Dio _dio;
  Dio get dio => _dio;
  DioFactory() : _dio = Dio() {
    _dio.options
      ..baseUrl = ApiConstants.baseUrl
      ..connectTimeout = Duration(milliseconds: ApiConstants.connectionTimeout)
      ..receiveTimeout = Duration(milliseconds: ApiConstants.receiveTimeout)
      ..sendTimeout = Duration(milliseconds: ApiConstants.sendTimeout);
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );
  }
}