import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp_clone/domain/usescases/auth/get_user.dart';
import 'package:musicapp_clone/pages/profile/bloc/profile_state.dart';

import '../../../service_locator.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit() : super(ProfileLoading());

  Future<void> getUser() async{
    var user = await sl<GetUserUseCase>().call();

    user.fold(
        (l){
          print("Error: ${l.toString()}");
          emit(ProfileError());
        },
        (r){
          emit(ProfileLoaded(userEntity: r));
        }
    );
  }
}