import 'package:bloc_pattern/data/login_register_data_source.dart';
import 'package:bloc_pattern/data/login_repoimpl.dart';

import 'login_repository.dart';

abstract class LoginUseCase{
  Future<void> loginUser(String email, String password);


}

class LoginUseCaseImpl implements LoginUseCase {
  final LoginRepository _repository = LoginRepositoryImpl(remoteDataSource: LoginRemoteSourceImpl());

  @override
  Future<String?> loginUser(String email, String password) async {
   final result  = await _repository.loginUser(email, password);
   if(result!=null)
     {
       return "Success";
     }
  }

}