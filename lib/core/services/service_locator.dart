import 'package:get_it/get_it.dart';
import 'package:todo_bloc/core/api/api_calls.dart';
import 'package:todo_bloc/features/home/data/repositories/todo_repository.dart';
import 'package:todo_bloc/features/home/data/sources/todo_data_source.dart';

GetIt getIt = GetIt.instance;

serviceLocator() {
  getIt.registerLazySingleton<ApiCalls>(() => ApiCalls());

  getIt.registerLazySingleton<TodoDataSource>(
      () => TodoDataSourceImpl(getIt<ApiCalls>()));
  getIt.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(getIt<TodoDataSource>()));
}
