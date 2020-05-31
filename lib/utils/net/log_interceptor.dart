import 'package:dio/dio.dart';
import 'package:flutter_eyes/utils/log_util.dart';

class LogsInterceptor extends InterceptorsWrapper {
  @override
  Future onError(DioError err) {
    LogUtil.e('[ERROR]===${err.request.uri}  ${err.response.statusCode}');
    return super.onError(err);
  }

  @override
  Future onRequest(RequestOptions options) {
    LogUtil.d('[REQUEST]===[${options.method.toString()}][URL]' + options.uri.toString());
    LogUtil.d('[REQUEST]===[Parameters]' + options.queryParameters.toString());
    LogUtil.d('[REQUEST]===[Header]' + options.headers.toString());
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    LogUtil.d('[RESPONSE]===${response.statusCode}');
    return super.onResponse(response);
  }
}
