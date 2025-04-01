import 'package:dartz/dartz.dart';
import 'package:musicapp_clone/data/models/auth/signin_user.dart';
import 'package:musicapp_clone/domain/repository/auth.dart';
import 'package:musicapp_clone/usecase/usecase.dart';
import '../../../service_locator.dart';

class SigninUseCase implements UseCase<Either,SignInUser> {
  @override
  Future<Either> call({SignInUser ? params}) {
    return sl<AuthRepository>().signIn(params!);
  }

}

