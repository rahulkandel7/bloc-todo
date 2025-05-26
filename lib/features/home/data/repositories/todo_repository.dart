import 'package:dartz/dartz.dart';
import 'package:todo_bloc/core/api/api_error.dart';
import 'package:todo_bloc/core/api/dio_exception.dart';
import 'package:todo_bloc/features/home/data/models/todo.dart';
import 'package:todo_bloc/features/home/data/sources/todo_data_source.dart';

abstract class TodoRepository {
  Future<Either<ApiError, List<Todo>>> fetchTodo();
  Future<Either<ApiError, String>> storeTodo(
      {required Map<String, dynamic> data});

  Future<Either<ApiError, String>> deleteTodo({required int id});
}

class TodoRepositoryImpl extends TodoRepository {
  final TodoDataSource todoDataSource;

  TodoRepositoryImpl(this.todoDataSource);

  @override
  Future<Either<ApiError, List<Todo>>> fetchTodo() async {
    try {
      final result = await todoDataSource.fetchTodo();
      return right(result);
    } on CustomDioException catch (e) {
      return left(
        ApiError(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<ApiError, String>> storeTodo(
      {required Map<String, dynamic> data}) async {
    try {
      final result = await todoDataSource.storeTodo(data: data);
      return right(result);
    } on CustomDioException catch (e) {
      return left(
        ApiError(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<ApiError, String>> deleteTodo({required int id}) async {
    try {
      final result = await todoDataSource.deleteTodo(id: id);
      return right(result);
    } catch (e) {
      return left(
        ApiError(errorMessage: e.toString()),
      );
    }
  }
}
