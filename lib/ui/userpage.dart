import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget{
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('User Screen'),
      ),
      body: BlocBuilder(
        builder: (context,state) =>Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _messageBox(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _messageBox(){
    return const Text(
      'login successfully',
    );
  }


}