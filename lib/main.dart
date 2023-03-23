import 'package:bloc_pattern/bloc/login_bloc.dart';
import 'package:bloc_pattern/domain/login_usecase.dart';
import 'package:bloc_pattern/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        // create: (_) => LoginBloc(LoginUseCaseImpl()),
        providers: [
          BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(),
          ),

          BlocProvider<CounterCubit>(
            create: (BuildContext context) => CounterCubit(),
          ),
        ],
        // create: (_) => CounterCubit(),
        child: LoginScreen(),
      ),
    );
  }
}
