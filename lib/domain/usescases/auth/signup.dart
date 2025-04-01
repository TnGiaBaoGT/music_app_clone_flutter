import 'package:dartz/dartz.dart';
import 'package:musicapp_clone/data/models/auth/create_user.dart';
import 'package:musicapp_clone/domain/repository/auth.dart';
import 'package:musicapp_clone/usecase/usecase.dart';

import '../../../service_locator.dart';

class SignupUseCase implements UseCase<Either,CreateUser> {
  @override
  Future<Either> call({CreateUser ? params}) async{
    return sl<AuthRepository>().signUp(params!);
  }
}

