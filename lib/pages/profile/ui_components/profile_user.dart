import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp_clone/app_config/theme_checker.dart';
import 'package:musicapp_clone/pages/profile/bloc/profile_cubit.dart';
import 'package:musicapp_clone/pages/profile/bloc/profile_state.dart';


class ProfileUser extends StatelessWidget {
  const ProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => ProfileCubit()..getUser(),
      child: BlocBuilder<ProfileCubit,ProfileState>(
          builder: (context, state) {
            if(state is ProfileLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is ProfileLoaded){
              final dataUser = state.userEntity;
              return Column(
                children: [
                  SizedBox(height: size.height *0.12),
                  Container(
                    width: 95,
                    height: 95,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage('${dataUser.imageUrl}'),fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text('${dataUser.email}',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: ThemeChecker.isDarkMode(context) ? const Color(0xffD8D4D4) : const Color(0xff222222),
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('${dataUser.fullName}',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: ThemeChecker.isDarkMode(context) ? const Color(0xffD8D4D4) : const Color(0xff222222),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
      ),
    );
  }
}
