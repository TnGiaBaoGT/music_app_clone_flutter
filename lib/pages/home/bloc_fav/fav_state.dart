abstract class FavState{}

class FavInitial extends FavState{}

class FavUpdated extends FavState{
  final bool isFav;
  FavUpdated({
    required this.isFav,
});
}