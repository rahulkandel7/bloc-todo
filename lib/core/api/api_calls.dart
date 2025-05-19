import 'package:dio/dio.dart';
import 'package:todo_bloc/constants/api_constants.dart';
import 'package:todo_bloc/core/api/dio_exception.dart';

class ApiCalls {
  //* get method
  getData({required String endpoint}) async {
    try {
      final Dio dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.apiBaseUrl,
        ),
      );
      final response = await dio.get(endpoint);
      return response.data;
    } on DioException catch (e) {
      throw CustomDioException.fromDioError(e);
    }
  }

  // * Send Data
  sendData(
      {required String endpoint, required Map<String, dynamic> data}) async {
    try {
      final Dio dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.apiBaseUrl,
        ),
      );
      final response = await dio.post(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      throw CustomDioException.fromDioError(e);
    }
  }
}
