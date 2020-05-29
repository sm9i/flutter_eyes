import 'package:dio/dio.dart';
import 'package:flutter_eyes/constants/configuration.dart';
import 'package:flutter_eyes/utils/net/log_interceptor.dart';

class NetUtil {
  const NetUtil._();

  static final Dio _dio = Dio();

  //读写超时
  static const _CONNECT_TIME_OUT = 5000;
  static const _RECEIVE_TIME_OUT = 5000;
  static const _SEND_TIME_OUT = 5000;

  static void initConfig() {
    //拦截器
    _dio.interceptors.add(LogsInterceptor());
    //option

    _dio.options = BaseOptions(
      baseUrl: Config.baseUrl,
      connectTimeout: _CONNECT_TIME_OUT,
      receiveTimeout: _RECEIVE_TIME_OUT,
      sendTimeout: _SEND_TIME_OUT,
      queryParameters: <String, dynamic>{
        'udid': 'd0f6190461864a3a978bdbcb3fe9b48709f1f390',
        'vc': '225',
        'vn': '3.12.0',
        'deviceModel': 'Redmi%204',
        'first_channel': 'eyepetizer_xiaomi_market',
        'last_channel': 'eyepetizer_xiaomi_market',
        'system_version_code': '23',
      },
      headers: <String, dynamic>{
        'Content-Type': 'application/json',
        'Cookie': 'ky_auth=;sdk=23',
        'model': 'Android',
        'User-Agent':
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36'
      },
    );
  }

  static Future<T> _request<T>(String url,
      {Map<String, dynamic> data,
      Map<String, dynamic> queryParameters,
      String method = 'GET'}) async {
    T result;
    try {
      final Response<T> response = await _dio.request<T>(
        url,
        queryParameters: queryParameters,
        data: data,
        options: Options(method: method),
      );

      result = response.data;
    } on DioError catch (e) {
      throw BaseError(ErrorCode.network, '${e.response.data}');
    }
    return result;
  }

  static Future<T> post<T>(String url,
      {Map<String, dynamic> data, Map<String, dynamic> queryParameters}) {
    data = data ?? <String, dynamic>{};

    queryParameters = queryParameters ?? <String, dynamic>{};
    return _request<T>(url,
        data: data, queryParameters: queryParameters, method: 'POST');
  }

  static Future<T> get<T>(String url, {Map<String, dynamic> queryParameters}) {
    queryParameters = queryParameters ?? <String, dynamic>{};
    return _request<T>(url,
        data: <String, dynamic>{}, queryParameters: queryParameters);
  }
}

class BaseError {
  final ErrorCode errorCode;
  final String errorMsg;

  const BaseError(this.errorCode, this.errorMsg);
}

enum ErrorCode {
  convert,
  network,
}
