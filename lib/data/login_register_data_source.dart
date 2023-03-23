import 'package:bloc_pattern/data/model/login_model.dart';
import 'package:dio/dio.dart';

abstract class LoginRemoteSource {

  Future<void> login(LoginRequestModel loginRequestModel);


 }

 class LoginRemoteSourceImpl implements LoginRemoteSource {


   @override
   Future<LoginResponseModel?> login(
       LoginRequestModel loginRequestModel) async {
     final dio = Dio();

     Response response = await dio.get('https://reqres.in/api/login');
     if (response.statusCode == 200 ) {
       return LoginResponseModel.fromJson(response.data);
     }
   }
 }