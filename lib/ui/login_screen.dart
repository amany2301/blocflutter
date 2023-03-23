import 'package:bloc_pattern/bloc/login_bloc.dart';
import 'package:bloc_pattern/bloc/login_event.dart';
import 'package:bloc_pattern/bloc/login_state.dart';
import 'package:bloc_pattern/domain/login_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _loginUsername(),
              _loginPassword(),
              // _loginButton(context),
              TextButton(
                  onPressed: () {
                    // context.read<LoginBloc>().loginUseCase.loginUser("email", "password");
                    context.read<LoginBloc>().login(
                      context,
                      LoginSubmit(
                        email: "email",
                        password: "password",
                      ),
                    );

                    context.read<LoginBloc>().printLog();
                    /*ctx.read<LoginBloc>().add(
                 LoginSubmit(email: 'Email', password: 'Pass'));*/
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*context.read<LoginBloc>().mapEventToState(
            LoginSubmit(
              email: "email",
              password: "password",
            ),
          );*/
          context.read<CounterCubit>().printLog();
        },
      ),
    );
  }

  Widget _loginUsername() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'user name',
      ),
    );
  }

  Widget _loginPassword() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Enter password',
      ),
    );
  }

  // Widget _loginButton(BuildContext context) {
  //   return TextButton(
  //       onPressed: () {
  //         // context.read<LoginBloc>().loginUseCase.loginUser("email", "password");
  //         context.read<LoginBloc>().mapEventToState(
  //               LoginSubmit(
  //                 email: "email",
  //                 password: "password",
  //               ),
  //             );
  //         /*ctx.read<LoginBloc>().add(
  //                LoginSubmit(email: 'Email', password: 'Pass'));*/
  //       },
  //       child: const Text(
  //         "Submit",
  //         style: TextStyle(color: Colors.black),
  //       ));
  // }
}
