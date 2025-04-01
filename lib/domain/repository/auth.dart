import 'package:dartz/dartz.dart';
import 'package:musicapp_clone/data/models/auth/create_user.dart';
import 'package:musicapp_clone/data/models/auth/signin_user.dart';

abstract class AuthRepository{

  Future<Either> signIn(SignInUser signinUser);

  Future<Either> signUp(CreateUser createUser);

  Future<Either> getUser();

  Future<Either> logout();
}