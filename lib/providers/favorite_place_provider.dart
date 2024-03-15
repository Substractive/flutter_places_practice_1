import 'package:favorite_places/models/favorite_place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlaceNotifier extends StateNotifier<List<FavoritePlace>> {
  FavoritePlaceNotifier() : super([]);

  void addPlace(FavoritePlace place) {
    print(state);
    state = [
      ...state,
      place,
    ];
    print(state);
  }
}

final favoritePlacesProvider =
    StateNotifierProvider<FavoritePlaceNotifier, List<FavoritePlace>>((ref) {
  return FavoritePlaceNotifier();
});
