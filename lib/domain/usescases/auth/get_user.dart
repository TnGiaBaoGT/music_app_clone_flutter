import 'package:dartz/dartz.dart';
import 'package:musicapp_clone/domain/repository/auth.dart';
import 'package:musicapp_clone/usecase/usecase.dart';
import '../../../service_locator.dart';

class GetUserUseCase implements UseCase<Either,dynamic> {
  @override
  Future<Either> call({params}) async{
    return await sl<AuthRepository>().getUser();
  }
}

