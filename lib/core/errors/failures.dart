import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: "Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: "Send timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: "Receive timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: "Bad Certificate  with ApiServer");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          statusCode: dioException.response!.statusCode!,
          response: dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
            errMessage: "Request  with ApiServer was canceled");
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: "No Internet");
      case DioExceptionType.unknown:
        if (dioException.message!.contains("SocketException")) {
          return ServerFailure(errMessage: "No Internet Connection");
        }
        return ServerFailure(
            errMessage: "Unexpected Error , Please try again!",
        );
      default:
        return ServerFailure(
            errMessage: "Opps There was an Error ,Please try again later!");
    }
  }

  factory ServerFailure.fromResponse(
      {required int statusCode, required dynamic response}) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: "Your request not found , Please try again later!");
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: "Internal server error ,Please try again later!");
    } else {
      return ServerFailure(
          errMessage: "Opps There was an Error ,Please try again later!");
    }
  }

}
