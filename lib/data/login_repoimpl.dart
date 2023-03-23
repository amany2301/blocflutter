import 'dart:math';

import 'package:bloc_pattern/domain/login_repository.dart';

import 'login_register_data_source.dart';
import 'model/login_model.dart';

class LoginRepositoryImpl extends LoginRepository{

  final LoginRemoteSource _loginRemoteSource;

  LoginRepositoryImpl({
    required LoginRemoteSource remoteDataSource,
  })  : _loginRemoteSource = remoteDataSource;



  @override
  Future<dynamic> loginUser(String email, String password) async {

    var login  = LoginRequestModel(email: email, password: password);
    var response = await _loginRemoteSource.login(login);
    return response;
  }

}