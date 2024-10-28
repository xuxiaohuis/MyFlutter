import 'package:dio/dio.dart';

////自定义异常
class AppException implements Exception {
  final String? message;
  final int? code;
  static const int CODE_UNKOWN_ERROR = 101;
  static const int CODE_NEWWORK_ERROR = 102;

  AppException([
    this.code,
    this.message,
  ]);

  @override
  String toString() {
    return "$code$message";
  }

  factory AppException.create(DioError error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        {
          return AppException(-1, "请求取消");
        }
      case DioExceptionType.connectionTimeout:
        {
          return AppException(-1, "连接超时");
        }
      case DioExceptionType.sendTimeout:
        {
          return AppException(-1, "请求超时");
        }
      case DioExceptionType.receiveTimeout:
        {
          return AppException(-1, "响应超时");
        }
      case DioExceptionType.badResponse:
        {
          try {
            int? errCode = error.response?.statusCode;
            return AppException(errCode, error.response?.statusMessage);
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
/*            switch (errCode) {
              case 400:
                {
                  return AppException(errCode, "请求语法错误");
                }
              case 401:
                {
                  return AppException(errCode, "没有权限");
                }
              case 403:
                {
                  return AppException(errCode, "服务器拒绝执行");
                }
              case 404:
                {
                  return AppException(errCode, "无法连接服务器");
                }
              case 405:
                {
                  return AppException(errCode, "请求方法被禁止");
                }
              case 500:
                {
                  return AppException(errCode, "服务器内部错误");
                }

              case 502:
                {
                  return AppException(errCode, "无效的请求");
                }

              case 503:
                {
                  return AppException(errCode, "服务器挂了");
                }

              case 505:
                {
                  return AppException(errCode, "不支持HTTP协议请求");
                }

              default:
                {
                  // return ErrorEntity(code: errCode, message: "未知错误");
                  LogW(error.response?.statusMessage ?? "");
                  return AppException(errCode, error.response?.statusMessage);
                }
            }*/
          } on Exception catch (_) {
            return AppException(-1, "未知错误");
          }
        }

      default:
        {
          return AppException(-1, "网络连接异常");
          // return AppException(-1, error.message);
        }
    }
  }
}
