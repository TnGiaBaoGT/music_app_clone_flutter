import 'package:dartz/dartz.dart';
import 'package:musicapp_clone/data/models/auth/signin_user.dart';
import 'package:musicapp_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:musicapp_clone/domain/repository/auth.dart';
import '../../../service_locator.dart';
import '../../models/auth/create_user.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SignInUser signinUser) async{
   return await sl<AuthFirebaseService>().signIn(signinUser);
  }

  @override
  Future<Either> signUp(CreateUser createUser) async{
    return await sl<AuthFirebaseService>().signUp(createUser);
  }

  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }

  @override
  Future<Either> logout() async{
    return await sl<AuthFirebaseService>().signOut();
  }

}