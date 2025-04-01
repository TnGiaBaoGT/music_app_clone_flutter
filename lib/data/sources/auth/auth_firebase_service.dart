import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:musicapp_clone/assets/app_url_covers/app_url.dart';
import 'package:musicapp_clone/data/models/auth/create_user.dart';
import 'package:musicapp_clone/data/models/auth/signin_user.dart';
import 'package:musicapp_clone/data/models/auth/user.dart';
import 'package:musicapp_clone/domain/entities/auth/user.dart';

abstract class AuthFirebaseService{

  Future<Either> signIn(SignInUser signinUser);

  Future<Either> signUp(CreateUser createUser);

  Future<Either> getUser();

  Future<Either> signOut();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signIn(SignInUser signinUser) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUser.email,
          password: signinUser.pass);
      return const Right('SignIn success');
    }
    on FirebaseAuthException catch (e) {
      String mess = '';

      if (e.code == 'invalid-email') {
        mess = 'Email doesn\'t have an account yet or wrong email';
      } else if (e.code == 'invalid-credential') {
        mess = 'Email or password is incorrect';
      }
      return Left(mess);
    }
  }

  @override
  Future<Either> signUp(CreateUser createUser) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUser.email,
          password: createUser.password);
      FirebaseFirestore.instance.collection('user').doc(data.user?.uid)
          .set(
          {
            'name': createUser.fullName,
            'email': data.user?.email,
          }
      );

      return const Right('SignUp success');
    }
    on FirebaseAuthException catch (e) {
      String mess = '';

      if (e.code == 'weak-password') {
        mess = 'The password is too weak';
      } else if (e.code == 'email-already-in-use') {
        mess = 'Email already exists';
      }
      return Left(mess);
    }
  }

//   @override
//   Future<Either> getUser() async {
//     try {
//       FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//       FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//
//       var user = await firebaseFirestore.collection('user').doc(
//           firebaseAuth.currentUser?.uid
//       ).get();
//
//       UserModel userModel = UserModel.fromJson(user.data()!);
//       userModel.imageUrl = firebaseAuth.currentUser?.photoURL ?? AppUrl.profile;
//       UserEntity userEntity = userModel.toEntity();
//       return Right(userEntity);
//     }
//     catch (e) {
//       return const Left('Failed to load profile.');
//     }
//   }
// }

  @override
  Future<Either> getUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      print("UID hiện tại: ${firebaseAuth.currentUser?.uid}");

      if (firebaseAuth.currentUser == null) {
        print("User chưa đăng nhập!");
        return const Left('User chưa đăng nhập.');
      }

      var userDoc = await firebaseFirestore.collection('user')
          .doc(firebaseAuth.currentUser?.uid)
          .get();

      if (!userDoc.exists || userDoc.data() == null) {
        print("User không tồn tại trong Firestore!");
        return const Left('User không tồn tại trong Firestore.');
      }

      print("User data từ Firestore: ${userDoc.data()}");

      UserModel userModel = UserModel.fromJson(userDoc.data()!);
      userModel.imageUrl = firebaseAuth.currentUser?.photoURL ?? AppUrl.profile;
      UserEntity userEntity = userModel.toEntity();

      return Right(userEntity);
    } catch (e, stacktrace) {
      print("Exception khi load profile: $e");
      print("Stacktrace: $stacktrace");
      return Left('Lỗi khi tải hồ sơ: $e');
    }
  }

  @override
  Future<Either> signOut() async {
    try{
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      await firebaseAuth.signOut();
      return const Right(null);
    }
    catch(e){
      return const Left('Failed to logout.');
    }

  }
}
