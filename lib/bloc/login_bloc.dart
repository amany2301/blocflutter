import 'package:bloc_pattern/bloc/login_event.dart';
import 'package:bloc_pattern/bloc/login_state.dart';
import 'package:bloc_pattern/ui/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/login_usecase.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(loginSuccess: false));

  LoginUseCase loginUseCase = LoginUseCaseImpl();

  // Stream<LoginState> mapEventToState(LoginEvent event) async* {
  //   if (event is LoginSubmit) {
  //     var resp = state;
  //     final login = loginUseCase.loginUser(event.email, event.password);
  //
  //     if (login != null) {
  //       resp.loginSuccess = true;
  //     }
  //
  //     yield resp;
  //   }
  // }

  login(BuildContext context, LoginEvent event) {
    if (event is LoginSubmit) {
      var resp = state;
      final login = loginUseCase.loginUser(event.email, event.password);

      if (login != null) {
        resp.loginSuccess = true;
      }

      /// Success response
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }

  printLog() {
    print("object");
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  void printLog() => print("Testing Nirav");
}
