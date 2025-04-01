import 'package:firebase_auth/firebase_auth.dart';
import 'package:musicapp_clone/domain/entities/auth/user.dart';

class UserModel {
  String ? fullName;
  String ? email;
  String ? imageUrl;

  UserModel({
    this.fullName,
    this.email,
    this.imageUrl,
  });

  UserModel.fromJson(Map<String,dynamic> json){
    fullName = json['name'];
    email = json['email'];
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      fullName: fullName,
      email: email,
      imageUrl: imageUrl,
    );
  }
}