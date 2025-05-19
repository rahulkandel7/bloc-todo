import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/constants/app_routes.dart';
import 'package:todo_bloc/core/services/service_locator.dart';
import 'package:todo_bloc/features/home/data/repositories/todo_repository.dart';
import 'package:todo_bloc/features/home/presentation/blocs/bloc/todo_bloc.dart';
import 'package:todo_bloc/features/home/presentation/screens/add_todo_screen.dart';
import 'package:todo_bloc/features/home/presentation/screens/home_screen.dart';

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => TodoBloc(getIt<TodoRepository>())),
      ],
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
        routes: {
          AppRoutes.homeScreen: (ctx) => HomeScreen(),
          AppRoutes.addTodoScreen: (ctx) => AddTodoScreen(),
        },
      ),
    );
  }
}
