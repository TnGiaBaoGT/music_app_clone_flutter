import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp_clone/pages/home/bloc_fav/fav_cubit.dart';
import 'package:musicapp_clone/pages/home/bloc_fav/fav_state.dart';

import '../domain/entities/songs/song.dart';

class FavButton extends StatelessWidget {
  final Function? function;
  const FavButton({
    super.key,
    required this.data,
    this.function,
  });

  final SongEntity data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavCubit(),
      child: BlocBuilder<FavCubit,FavState>(
        builder: (context, state) {
          print(state);
          if (state is FavInitial){
            return IconButton(
                onPressed: () {
                  context.read<FavCubit>().favUpdated(
                    data.songId
                  );
                  if (function != null) {
                    function!();
                  }
                },
                icon: Icon(
                    color: data.isFav ? Colors.orangeAccent : null,
                    data.isFav ? Icons.favorite :Icons.favorite_border_rounded
                ));
          }
          if (state is FavUpdated){
            return IconButton(
                onPressed: () {
                  context.read<FavCubit>().favUpdated(
                      data.songId
                  );
                },
                icon: Icon(
                    color: state.isFav ? Colors.orangeAccent : null,
                    state.isFav ? Icons.favorite :Icons.favorite_border_rounded
                ));
          }
          return Container();
        }
      ),
    );
  }
}
