import 'package:dio/dio.dart';

class ApiError implements Exception {
  ApiError.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;
      case DioExceptionType.badResponse:
        message = _handleResponseError(
          error.response?.statusCode,
          error.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;
      case DioExceptionType.badCertificate:
        message = 'Bad Certificate';
        break;
      case DioExceptionType.connectionError:
        message = 'No Internet connection';
        break;
      case DioExceptionType.unknown:
        if (error.message != null &&
            error.message!.contains('SocketException')) {
          message = 'No Internet connection';
          break;
        }

        message = 'Unexpected error occurred';
        break;
    }
  }
  late String message;

  String _handleResponseError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return _evaluateErrorData(error);
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return _evaluateErrorData(error);
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Opss! something went wrong';
    }
  }

  String _evaluateErrorData(dynamic error) {
    final err1 = error as Map<String, dynamic>?;
    final message = err1?['error'] as String?;

    return (message != null) ? message : 'Opss! something went wrong';
  }

  @override
  String toString() => message;
}
